include_recipe "chef-streambot-aws::cli"

instance = node[:aws_instance]

################################################################################
# Install script for updating hostname
################################################################################

template node[:hostname_script] do
	source 	"update-hostname.sh.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:env	=> instance[:env],
		:role 	=> instance[:role]
	})
end

################################################################################
# Install script for updating AWS tags
################################################################################

template node[:aws_tags_script] do
	source 	"update-aws-tags.sh.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:user => node[:aws_cli][:user][:name]
	})
end

################################################################################
# Install collectd monitoring
################################################################################

include_recipe "chef-streambot-aws::collectd"

################################################################################
# Install provision upstart job
################################################################################

template '/etc/init/update-instance-infos.conf' do
	source 	"update-instance-infos.conf.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:scripts => node[:startup_scripts]
	})
end