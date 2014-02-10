template "#{node[:streambot_api][:src]}/Gomfile" do
	source "Gomfile.erb"
	owner  "root"
	mode   "744"
	variables({
		:deps => node[:gom_packages]
	})
end

user = node[:streambot_api][:user][:name]
group = node[:streambot_api][:user][:group]

bash "install_gom_dependencies" do
	cwd 	node[:streambot_api][:src]
	code 	"source /etc/profile; gom install"
	user 	user
	group 	group
end