include_recipe "chef-streambot-scm-access"
include_recipe "chef-streambot-aws::instance"
include_recipe "chef-streambot-aws::cli"

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