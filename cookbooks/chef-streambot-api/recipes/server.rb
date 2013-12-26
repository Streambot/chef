include_recipe "chef-streambot-api"

group node['streambot']['node']['group']

user node['streambot']['node']['user'] do
	comment		'Streambot API node (ssh)'
	gid 		node['streambot']['node']['group']
	home 		node['streambot']['node']['home']
	shell 		node['streambot']['node']['shell']
end

directory "/opt/go" do
	owner 		node['streambot']['node']['user']
	group 		node['streambot']['node']['group']
	recursive	true
end

bash "build_streambot_api" do
	cwd		"/tmp"
	user 	"root"
	group 	"root"
	code 	<<-EOH
	tar xvfj #{node[:streambot][:api][:src]}
	cd streambot-api
	/usr/local/go/bin/go build api.go
	mkdir -p #{File.dirname(node[:streambot][:api][:binary])}
	mv api #{node[:streambot][:api][:binary]}
	ln -s #{node[:streambot][:api][:binary]} /usr/bin/#{File.basename(node[:streambot][:api][:binary])}
	chmod 0755 #{node[:streambot][:api][:binary]}
	EOH
  	not_if { ::File.exists?(node[:streambot][:api][:binary]) }
end

template "/etc/init/streambot-api.conf" do
  source      'streambot-api.conf.erb'
  owner       'root'
  group       'root'
  mode        '0644'
end