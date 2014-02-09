include_recipe "apt"

include_recipe "statsd"
include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

include_recipe "chef-streambot-api::gom_packages"

# Verify, that StatsD is running on the machine
service "statsd" do
	action :restart
end