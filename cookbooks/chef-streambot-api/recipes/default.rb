include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

bash "load_etc_profile_on_interactive_shells" do
	user	:root
	cwd		"/tmp"
	code 	<<-EOH
	echo ". /etc/profile" >> /etc/bash.bashrc
	EOH
end