include_recipe "chef-streambot-api"

template "/etc/profile.d/api_vagrant.sh" do
	source "vagrant_api_bash_profile.sh.erb"
	variables({
		:go_path => "/vagrant" 
	})
end

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end