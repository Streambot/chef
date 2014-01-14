include_recipe "chef-streambot-api"

ENV['GOPATH'] = "#{ENV['GOPATH']}:/vagrant"

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end