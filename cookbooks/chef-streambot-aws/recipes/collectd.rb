# Get the add-apt-repository command
execute "install add-apt-repository" do
  command "sudo apt-get install python-software-properties -y"
end

# Add ppa to make version 1.7+ of Subversion available
execute "add-apt-repository" do
  command "sudo add-apt-repository ppa:kmscherer/collectd"
end

# apt-get update to bring in the ppa contents
execute "apt-get update" do
  command "sudo apt-get update"
end

# apt-get install subversion
package "collectd" do
  action :install
end

# Update collectd hostname settings
collectd_conf_file = "/etc/collectd/collectd.conf"
bash "update_collectd_conf_for_hostname" do
	user "root"
  	cwd "/tmp"
	code <<-EOH
	cp #{collectd_conf_file} #{collectd_conf_file}.old
	sed "s/#Hostname \"[^\"]*\"/Hostname \"`cat \\/etc\\/hostname`\"/" #{collectd_conf_file}.old > #{collectd_conf_file}
	rm #{collectd_conf_file}.old
	cp #{collectd_conf_file} #{collectd_conf_file}.old
	sed "s/FQDNLookup true/FQDNLookup false/" #{collectd_conf_file}.old > #{collectd_conf_file}
	rm #{collectd_conf_file}.old
	EOH
end

# Install Graphite configuration for Collectd from template
graphite_conf_file = "/etc/collectd/graphite.conf"
template graphite_conf_file do
	source 	"graphite.collectd.conf.erb"
	mode	0644
	owner 	"root"
	group 	"root"
	variables(node[:collectd])
end

# Add an include on the Graphite configuration for collectd to main collectd configuration
bash "echo \"Include \\\"#{graphite_conf_file}\\\"\" >> /etc/collectd/collectd.conf"

# Restart collectd daemon to adopt installed configuration
service "collectd" do
	action :restart
end