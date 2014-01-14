include_recipe "chef-streambot-api"

template "/etc/profile.d/vagrant_api_profile.sh" do
	source "vagrant_api_profile.sh.erb"
	variables({
		:go_path => "/vagrant" 
	})
end

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end