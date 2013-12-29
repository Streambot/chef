bash "enable_multiverse_apt_repos" do
	user	"root"
	code <<-EOH
	cat /etc/apt/sources.list | sed 's/# \(.*multiverse\)/\1/g' > /etc/apt/sources.list
	apt-get update
	EOH
end

package "ec2-api-tools"
package "ec2-ami-tools"

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