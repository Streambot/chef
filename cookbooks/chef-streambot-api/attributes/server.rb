default["streambot"] = {
	:node => {
		:user 	=> "streambot",
		:group 	=> "streambot",
		:shell 	=> "/bin/bash",
		:home 	=> "/home/streambot",
		:go 	=> {
			:binary => "/usr/local/go/bin/go",
			:gopath => "/opt/go"
		}
	},
	:api => {
		:binary	=> "/opt/streambot/api/bin/streambot_api",
		:src 	=> "#{Chef::Config[:file_cache_path]}/streambot-api.tar.bz"
	}
}