include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

bash "link_go" do
	cwd		"/tmp"
	user 	"root"
	group 	"root"
	code 	<<-EOH
	ln -s #{node[:go][:install_dir]}/go/bin/go /usr/bin/go
	chmod 755 /usr/bin/go
	echo "GOPATH=#{node[:streambot][:node][:go][:gopath]}" >> /etc/environment
	EOH
end