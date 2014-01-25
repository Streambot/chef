include_recipe "chef-streambot-aws::access"
include_recipe "chef-streambot-aws::cli"

################################################################################
# Update AWS name tag for Streambot API server machine
################################################################################

instance = node[:aws_instance]

bash "update-aws-instance-name-tag" do
	code <<-EOH
	aws ec2 create-tags \
	--resources `ec2metadata --instance-id` \
	--tags Key=Name,Value=\
	#{instance[:role]}_#{instande[:env]}_`ec2metadata availability-zone`_\
	`ec2metadata --local-ipv4 | tr "." "-"`
	EOH
	user node[:aws_cli][:user]
end

################################################################################
# Install provision upstart job
################################################################################

template '/etc/init/build-ami' do
	source 	"provision.conf.erb"
	mode 	0755
	owner 	"root"
	group 	"root"
end