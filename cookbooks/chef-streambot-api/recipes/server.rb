include_recipe "chef-streambot-api"

group node['streambot']['node']['group']

user node['streambot']['node']['user'] do
	comment		'Streambot API node (ssh)'
	gid 		node['streambot']['node']['group']
	home 		node['streambot']['node']['home']
	shell 		node['streambot']['node']['shell']
end

template "/etc/init/streambot_api.conf" do
  source      'streambot-api.conf.erb'
  owner       'root'
  group       'root'
  mode        '0644'
end

service "streambot_api" do
  provider Chef::Provider::Service::Upstart
  action :nothing
end

# Build the Streambot API from its source. 
# Unfortunately the golang installation in the default recipe does not spread the go binary path and 
# the go path among all users via interactive shells. Therefore the root user does not know about 
# the go binary path, unless there is a login shell.
bash "build_streambot_api" do
	code 	<<-EOH
	cp #{node[:streambot][:api][:src]} api.tar.bz
	tar xvfj api.tar.bz
	rm api.tar.bz
	cd streambot-api
	/usr/local/go/bin/go build api.go
	mkdir -p #{File.dirname(node[:streambot][:api][:binary])}
	mv api #{node[:streambot][:api][:binary]}
	rm -rf streambot-api
	ln -s #{node[:streambot][:api][:binary]} /usr/bin/#{File.basename(node[:streambot][:api][:binary])}
	chmod 0755 #{node[:streambot][:api][:binary]}
	EOH
  	not_if { ::File.exists?(node[:streambot][:api][:binary]) }
  	environment({
  		"GOPATH" => "/opt/go"
  	})
  	notifies :restart, 'service[streambot_api]', :delayed
end