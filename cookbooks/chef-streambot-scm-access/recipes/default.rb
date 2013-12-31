package "git"

################################################################################
# Install public and private SSH keys for usage with the SCM
################################################################################

template "#{node[:build_ami][:user][:home]}/.ssh/id_rsa" do
	source 	"ssh_private_key.erb"
	mode 	0600
	owner 	node[:scm_aceess][:user][:name]
	group 	node[:scm_aceess][:user][:group]
end

template "#{node[:scm_aceess][:user][:home]}/.ssh/id_rsa.pub" do
	source 	"ssh_public_key.erb"
	mode 	0600
	owner 	node[:scm_aceess][:user][:name]
	group 	node[:scm_aceess][:user][:group]
end

################################################################################
# Disable strict host checking for SSH connections
################################################################################

bash "disable_strict_host_checking" do
	code <<-EOH
	echo "Host *\n\tStrictHostKeyChecking no\n" \
	>> #{node[:scm_aceess][:user][:home]}/.ssh/config
	EOH
end