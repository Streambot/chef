include_recipe "chef-streambot-api"

puts node['streambot']

group node['streambot']['node']['group']

user node['streambot']['node']['user'] do
  comment	'Streambot API node (ssh)'
  gid 		node['streambot']['node']['group']
  home 		node['streambot']['node']['home']
  shell 	node['streambot']['node']['shell']
end

directory "/opt/go" do
  owner 	node['streambot']['node']['user']
  group 	node['streambot']['node']['group']
  recursive true
end

bash "Make source tarball accessible for #{node[:node][:user]} user" do
	code "chown -R #{node[:node][:user]}:#{node[:node][:group]} #{node[:streambot][:api][:src]}"
end

bash "Build and install API server to #{node[:streambot][:api][:binary]}" do
	cwd		"/tmp"
	user 	"streambot"
	group 	"streambot"
	code 	<<-EOH
	tar xvfj #{node[:streambot][:api][:src]}
	cd streambot-api
	go build api.go
	mv api #{node[:streambot][:api][:binary]}
	EOH
end

template "/etc/init/streambot-api.conf" do
  source      'streambot-api.conf.erb'
  owner       'root'
  group       'root'
  mode        '0644'
end