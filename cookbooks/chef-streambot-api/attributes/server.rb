default["streambot_api"] = {
	:user 	=> {
		:name => "",
		:group 	=> "",
		:home 	=> "",
		:shell 	=> "/bin/bash"
	},
	:home	=> "",
	:src 	=> "#{Chef::Config[:file_cache_path]}/streambot-api",
	:scm	=> {
		:git_repository => "",
		:git_revision => "",
		:user => {
			:name => "",
			:group => ""
		}
	},
	:config => {
		:server => {
			:port => 8080
		},
		:database => {
			:graph => "streambot",
			:hosts => ["localhost:8182"]
		},
		:stats => {
			:port => 8125
		},
		:debug => true	
	}
}
default[:scm_access] = {
  :user => {
    :name => "",
    :group => "",
    :home => ""
  }
}