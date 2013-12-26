default["streambot"] = {
	:node => {
		:user 	=> "streambot",
		:group 	=> "streambot",
		:shell 	=> "/bin/bash",
		:home 	=> "/home/streambot"
	},
	:api => {
		:binary	=> "/usr/local/bin/streambot_api",
		:src 	=> "#{Chef::Config[:file_cache_path]}/streambot-api.tar.bz"
	}
}