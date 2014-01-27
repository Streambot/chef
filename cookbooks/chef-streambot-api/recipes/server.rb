include_recipe "apt"
include_recipe "chef-streambot-api"

group node[:streambot_api][:user][:group]

user node[:streambot_api][:user][:name] do
	comment		'Streambot API node (ssh)'
	gid 		node[:streambot_api][:user][:group]
	home 		node[:streambot_api][:user][:home]
	shell 		node[:streambot_api][:user][:shell]
end

include_recipe "chef-streambot-scm-access"

config_file = "#{node[:streambot_api][:home]}/conf/api.json"
binary = "#{node[:streambot_api][:home]}/bin/streambot-api"

template "/etc/init/streambot_api.conf" do
  source      'streambot-api.conf.erb'
  owner       'root'
  group       'root'
  mode        '0644'
  variables({
  	:user => node[:streambot_api][:user][:name],
  	:binary => binary,
    :config => config_file
  })
end

service "streambot_api" do
  provider Chef::Provider::Service::Upstart
  action :nothing
end

################################################################################
# Clone the Streambot API server source control repository
################################################################################

scm = node[:streambot_api][:scm]

git node[:streambot_api][:src] do
  repository 	scm[:git_repository]
  reference 	scm[:git_revision]
  user 			scm[:user][:name]
  group 		scm[:user][:group]
  action 		:sync
end

################################################################################
# Setup home directory of Streambot API server application
################################################################################

%w{bin conf}.each do |dir|
  directory "#{node[:streambot_api][:home]}/#{dir}" do
    owner "root"
    group "root"
    mode  "0644"
    action :create
    recursive true
  end
end

################################################################################
# Prepare config file for Streambot API server application
################################################################################

user = node[:streambot_api][:user][:name]
group = node[:streambot_api][:user][:group]

template config_file do 
  source      'config.json.erb'
  owner       user
  group       group
  mode        '0644'
  variables({
    :config => node[:streambot_api][:config]
  })
end

################################################################################
# Compile and install the Streambot API server application
################################################################################

# Build the Streambot API from its source. 
# Unfortunately the golang installation in the default recipe does not spread the go binary path and 
# the go path among all users via interactive shells. Therefore the root user does not know about 
# the go binary path, unless there is a login shell.
bash "build_streambot_api" do
	code 	<<-EOH
	cd #{node[:streambot_api][:src]}
  /usr/local/go/bin/go build main.go
  mv main #{binary}
	rm -rf #{node[:streambot_api][:src]}
	ln -s #{binary} /usr/bin/#{File.basename(binary)}
  chown -R #{user}:#{group} #{binary}
	chmod 0755 #{binary}
	EOH
	not_if { ::File.exists?(binary) }
	environment({ "GOPATH" => "/opt/go:#{node[:streambot_api][:src]}" })
	notifies :restart, 'service[streambot_api]', :delayed
end