node["override"]["go"] = {
	"gopath" => "/opt/go:/vagrant"
}

include_recipe "chef-streambot-api"

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end