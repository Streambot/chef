template "#{node[:streambot_api][:src]}/Gomfile" do
	source "Gomfile.erb"
	owner  "root"
	mode   "744"
	variables({
		:deps => node[:gom_packages]
	})
end

bash "install_gom_dependencies" do
	cwd node[:streambot_api][:src]
	code "gom install"
end