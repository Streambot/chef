user = node[:aws_cli][:user]
aws_cli_config_file = "#{user[:home]}/.aws/config"

directory File.dirname(aws_cli_config_file) do
  recursive true
end

template aws_cli_config_file do
	mode 	00600
    owner 	user[:name]
    group 	user[:group]
    source 	'cli_config.erb'
    action	:create_if_missing
    variables(user)
end

execute "apt-get install -y python-pip && pip install awscli"