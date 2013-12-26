include_recipe "default"

directory "/opt/go" do
  owner "vagrant"
  group "vagrant"
  recursive true
end