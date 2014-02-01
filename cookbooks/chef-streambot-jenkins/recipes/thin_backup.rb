jenkins_plugin 'thinBackup' do
  action :install
  version node[:jenkins_plugins][:thinBackup][:version]
end

directory "/var/backup" do
  owner "jenkins"
  group "jenkins"
  mode 00755
  action :create
end

if node[:jenkins][:server][:home].nil?
	Chef::Application.fatal! "Expected Jenkins user home folder attribute `jenkins.server.home` " \
	"from dependent jenkins cookbook dependency"
end

template "#{node[:jenkins][:server][:home]}/thinBackup.xml" do
	source "thinBackup.xml.erb"
	mode 0755
	owner "jenkins"
	group "jenkins"
	variables({
		:version => node[:jenkins_plugins][:thinBackup][:version]
	})
end
