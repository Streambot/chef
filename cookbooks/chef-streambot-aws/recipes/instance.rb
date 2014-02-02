include_recipe "chef-streambot-aws::cli"

instance 		= node[:aws_instance]
aws_tags_script = "/etc/update-aws-tags.sh"
hostname_script = "/etc/update-hostname.sh"

################################################################################
# Install script for updating hostname
################################################################################

template hostname_script do
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

template aws_tags_script do
	source 	"update-aws-tags.sh.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:user => node[:aws_cli][:user][:name]
	})
end

################################################################################
# Install provision upstart job
################################################################################

template '/etc/init/update-instance-infos.conf' do
	source 	"update-instance-infos.conf.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		# Order is important here!
		:scripts => [hostname_script, aws_tags_script]
	})
end

include_recipe "chef-streambot-aws::collectd"