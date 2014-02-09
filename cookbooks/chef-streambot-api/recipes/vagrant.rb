include_recipe "apt"
include_recipe "chef-streambot-api"

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end

################################################################################
# Add gom configuration and install dependencies
################################################################################
include_recipe "chef-streambot-api::gom_packages"

################################################################################
# Prepare config file for Streambot API server application
################################################################################

config_file = "/vagrant/api.json"

template config_file do 
  source      'config.json.erb'
  owner       'root'
  group       'root'
  mode        '0644'
  variables({
    :config => node[:streambot_api][:config]
  })
end