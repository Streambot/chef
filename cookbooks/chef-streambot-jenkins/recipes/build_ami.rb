package "git"

################################################################################
# Disable strict host checking for SSH connections in Jenkins automation
################################################################################

bash "disable_strict_host_checking" do
	code <<-EOH
	echo "Host *\n\tStrictHostKeyChecking no\n" \
	>> #{node[:build_ami][:user][:home]}/.ssh/config
	EOH
end

################################################################################
# Install PEM keyfile for instance creation in EC2
################################################################################

template node[:build_ami][:aws][:keypair][:file] do
	source	"jenkins.pem.erb"
	mode	0600
	owner 	node[:build_ami][:user][:name]
	group 	node[:build_ami][:user][:group]
end

################################################################################
# Install tool to create AMIs using the EC2 API
################################################################################

template '/usr/bin/build-ami' do
	source 	"build-ami.erb"
	mode 	0755
	owner 	node[:build_ami][:user][:name]
	group 	node[:build_ami][:user][:group]
	variables({
		:aws 				=> node[:build_ami][:aws],
		:chef_repo			=> node[:build_ami][:chef_repo],
		:deployment_repo	=> node[:build_ami][:deployment_repo]
	})
end

################################################################################
# Install public and private SSH keys for usage with Github
################################################################################

template "#{node[:build_ami][:user][:home]}/.ssh/id_rsa" do
	source 	"ssh_private_key.erb"
	mode 	0600
	owner 	node[:build_ami][:user][:name]
	group 	node[:build_ami][:user][:group]
end

template "#{node[:build_ami][:user][:home]}/.ssh/id_rsa.pub" do
	source 	"ssh_public_key.erb"
	mode 	0600
	owner 	node[:build_ami][:user][:name]
	group 	node[:build_ami][:user][:group]
end