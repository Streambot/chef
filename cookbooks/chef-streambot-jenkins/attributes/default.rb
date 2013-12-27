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
default[:ssh_authorized_keys] = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXKQxK4RbmtxFr7fqjxHJ3KupQovCjySeOyF4vrEF6cRARFDlTa4mt2Y4Sqy2JyYJ++VZugrvK+bQ/C9oq6UlP0U3gTEYQUJ2udxJKdLCr5aVbisNl1pz5kAPLJnlkReUkPhH41prOBrgSfyQac7LguGiHM6utlXXARsFchQdY2EaRyX9chlQnfI7y8DrIO3z2i/XMg0ok3nSv+OR1NH1cjR4A9ztkx44Tsaf50xepXrmx0ZEMWcGhFxtGr7bXsyd0UV8X6Lqvg08zFztxTg+1R8DmQvPZBjcmINE8xuVltvSft0+P8A7cs2cA84cu3RfDbU9rBgMzPxamrmAdkK4J martin.biermann@trademob.com"
]