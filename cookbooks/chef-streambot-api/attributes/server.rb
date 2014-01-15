default["streambot_api"] = {
	:user 	=> {
		:name => "",
		:group 	=> "",
		:home 	=> "",
		:shell 	=> "/bin/bash"
	},
	:binary	=> "/opt/streambot/api/bin/streambot_api",
	:src 	=> "#{Chef::Config[:file_cache_path]}/streambot-api",
	:scm	=> {
		:git_repository => "",
		:git_revision => "",
		:user => {
			:name => "",
			:group => ""
		}
	}
}
default[:scm_access] = {
  :user => {
    :name => "",
    :group => "",
    :home => ""
  }
}