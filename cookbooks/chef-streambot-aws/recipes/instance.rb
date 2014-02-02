include_recipe "collectd-write-graphite"
include_recipe "chef-streambot-aws::cli"

################################################################################
# Install script for updating AWS tags for Streambot API server machine
################################################################################

script 		= "/etc/update-aws-tags.sh"
instance 	= node[:aws_instance]

template script do
	source 	"update-aws-tags.sh.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:env	=> instance[:env],
		:role 	=> instance[:role],
		:user 	=> node[:aws_cli][:user][:name]
	})
end

################################################################################
# Install provision upstart job
################################################################################

template '/etc/init/update-aws-tags.conf' do
	source 	"update-aws-tags.conf.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	variables({
		:script => script
	})
end