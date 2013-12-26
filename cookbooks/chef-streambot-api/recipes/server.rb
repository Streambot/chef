include_recipe "chef-streambot-api"

group node['streambot']['node']['group']

user node['streambot']['node']['user'] do
	comment		'Streambot API node (ssh)'
	gid 		node['streambot']['node']['group']
	home 		node['streambot']['node']['home']
	shell 		node['streambot']['node']['shell']
end

bash "build_streambot_api" do
	cwd		"/tmp"
	user 	"root"
	group 	"root"
	code 	<<-EOH
	cp #{node[:streambot][:api][:src]} api.tar.bz
	tar xvfj api.tar.bz
	rm api.tar.bz
	cd streambot-api
	#{node[:node][:go][:binary]} build api.go
	mkdir -p #{File.dirname(node[:streambot][:api][:binary])}
	mv api #{node[:streambot][:api][:binary]}
	ln -s #{node[:streambot][:api][:binary]} /usr/bin/#{File.basename(node[:streambot][:api][:binary])}
	chmod 0755 #{node[:streambot][:api][:binary]}
	EOH
	environment({
    	'GOPATH' => node[:node][:go][:gopath]
    })
  	not_if { ::File.exists?(node[:streambot][:api][:binary]) }
end

template "/etc/init/streambot-api.conf" do
  source      'streambot-api.conf.erb'
  owner       'root'
  group       'root'
  mode        '0644'
end