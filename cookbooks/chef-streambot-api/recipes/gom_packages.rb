template "#{node[:streambot_api][:home]}/Gomfile" do
	source "Gomfile.erb"
	owner  "root"
	mode   "744"
	variables({
		:deps => node[:gom_packages]
	})
end