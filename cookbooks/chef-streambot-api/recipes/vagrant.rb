include_recipe "chef-streambot-api"

# Install another profile to be loaded on interactive shells
# Note that this script is called, and must be, AFTER the golang.sh script from the golang package. 
# Otherwise the golang.sh would override the changes from the template again,
template "/etc/profile.d/golang_vagrant.sh" do
	source "vagrant_golang_bash_profile.sh.erb"
	owner "root"
	group "root"
	mode 0755
	variables({
		:go_path => "/vagrant" 
	})
end

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end