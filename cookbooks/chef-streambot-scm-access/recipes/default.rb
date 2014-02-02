package "git"

################################################################################
# Install public and private SSH keys for usage with the SCM
################################################################################

directory "#{node[:scm_access][:user][:home]}/.ssh" do
	owner 	node[:scm_access][:user][:name]
	group 	node[:scm_access][:user][:group]
	mode 	0755
	action  :create
end

template "#{node[:scm_access][:user][:home]}/.ssh/id_rsa" do
	source 	"ssh_private_key.erb"
	mode 	0600
	owner 	node[:scm_access][:user][:name]
	group 	node[:scm_access][:user][:group]
end

template "#{node[:scm_access][:user][:home]}/.ssh/id_rsa.pub" do
	source 	"ssh_public_key.erb"
	mode 	0600
	owner 	node[:scm_access][:user][:name]
	group 	node[:scm_access][:user][:group]
end

################################################################################
# Disable strict host checking for SSH connections
################################################################################

bash "disable_strict_host_checking" do
	code <<-EOH
	echo "Host *\n\tStrictHostKeyChecking no\n" \
	>> #{node[:scm_access][:user][:home]}/.ssh/config
	EOH
end