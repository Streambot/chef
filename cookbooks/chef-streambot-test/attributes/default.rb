normal["go"] = {
	:version => "1.2",
	:scm => true,
	:binary => "/usr/local/go/bin/go",
	:gopath => "/opt/go",
	:packages => [
		"code.google.com/p/go-uuid/uuid",
		"github.com/mbiermann/go-cluster",
		"github.com/op/go-logging",
		"github.com/jessevdk/go-flags"
	]
}
default[:streambot_test] = {
	:user => {
		:name => "streambot",
		:group => "streambot",
		:shell => "/bin/bash",
		:home => "/home/streambot"
	},
	:home	=> "",
	:scm	=> {
		:git_repository => "",
		:git_revision => "",
		:user => {
			:name => "",
			:group => ""
		}
	}, 
	:config => {
		:api_hosts => [],
		:sample_rate => 0,
		:create_channel_throttle => 0,
		:subscribe_channel_throttle => 0,
		:get_subscription_throttle => 0,
		:num_workers => 0
	}
}
default[:scm_access] = {
  :user => {
    :name => "",
    :group => "",
    :home => ""
  }
}