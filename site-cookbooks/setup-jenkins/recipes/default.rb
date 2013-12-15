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

template '/var/lib/jenkins/thinBackup.xml' do
	source "thinBackup.xml.erb"
	mode 0755
	owner "jenkins"
	group "jenkins"
	variables({
		:version => node[:jenkins_plugins][:thinBackup][:version]
	})
end
