template node[:aws][:keypair][:file] do
	source	"jenkins.pem.rb"
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
		:aws 		=> node[:aws],
		:chef_repo	=> node[:chef_repo]
	})
end