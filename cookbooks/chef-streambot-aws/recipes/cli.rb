user = node[:aws_cli][:user]
aws_cli_config_file = "#{user[:home]}/.aws/config"

template aws_cli_config_file do
	mode 	00600
    owner 	user[:name]
    group 	user[:group]
    source 	'aws_cli_config.erb'
    not_if 	{ ::File.exists?(aws_cli_config_file) }
    variables(user)
end

execute "apt-get install -y python-pip && pip install awscli"