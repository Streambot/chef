include_recipe "apt"

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

package "update-notifier-common" do
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

execute "apt-get-update-periodic" do
  command "apt-get update"
  ignore_failure true
  only_if do
   File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
   File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  end
end

include_recipe "statsd"
include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

# Verify, that StatsD is running on the machine
service "statsd" do
	action :restart
end