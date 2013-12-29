include_recipe "aws_developer_tools"

template node[:build_ami][:aws][:keypair][:file] do
	source	"jenkins.pem.erb"
	mode	0766
	owner 	"jenkins"
	group 	"jenkins"
end

template '/usr/bin/build-ami' do
	source 	"build-ami.erb"
	mode 	0755
	owner 	"jenkins"
	group 	"jenkins"
	variables({
		:aws 				=> node[:build_ami][:aws],
		:chef_repo			=> node[:build_ami][:chef_repo],
		:deployment_repo	=> node[:build_ami][:deployment_repo]
	})
end