include_recipe "chef-streambot-aws::access"
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
		:role 	=> instance[:role]
	})
end

################################################################################
# Execute script for updating AWS tags for Streambot API server machine
################################################################################

bash "update_aws_tags" do
	cwd File.dirname(script)
	user "root"
	group "root"
	code <<-EOH
	 ./#{File.basename(script)}
	 EOH
end

################################################################################
# Install provision upstart job
################################################################################

template '/etc/init/update-aws-tag.conf' do
	source 	"update-aws-tag.conf.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
	varaiables({
		:script => script
	})
end