default[:build_ami] = {
	:aws => {
		:access_key => default[:aws][:access_key],
		:secret_key => default[:aws][:secret_key],
		:keypair => {
			:file => "#{default['jenkins']['server']['home']}/.ssh/jenkins.pem",
			:name => "jenkins"
		},
		:base_ami => "ami-07cb2670",
	},
	:deployment_repo => "git@bitbucket.org:streambot/deployment.git",
	:chef_repo => {
		:url 	=> "git@bitbucket.org:streambot/chef.git",
		:branch => "master"
	}
}