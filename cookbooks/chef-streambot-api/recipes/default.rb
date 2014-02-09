include_recipe "apt"

include_recipe "statsd"
include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

directory node[:streambot_api][:home] do
  owner "root"
  group "root"
  mode  "0644"
  action :create
  recursive true
end

include_recipe "chef-streambot-api::gom_packages"

# Verify, that StatsD is running on the machine
service "statsd" do
	action :restart
end