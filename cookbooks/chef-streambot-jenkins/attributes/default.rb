default[:jenkins_plugins][:thinBackup][:version] = "1.7.4"
default[:aws] = {
	:access_key => "AKIAJ4Z6VLJRBCHACPIA",
	:secret_key => "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",
	:s3_backup_bucket_uri => "s3://com.streambot.backup",
	:keypair => {
		:file => "#{default['jenkins']['server']['home']}/.ssh/jenkins.pem",
		:name => "jenkins"
	},
	:base_ami => "ami-07cb2670"
}
default[:chef_repo] = {
	:url 	=> "git@bitbucket.org:streambot/chef.git",
	:branch => "master"
}