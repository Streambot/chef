include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

bash "load_golang_profile_on_interactive_shells" do
	code 	<<-EOH
	echo '[[ -s "/etc/profile.d/golang.sh" ]] && . "/etc/profile.d/golang.sh"' >> /etc/bash.bashrc
	. "/etc/bash.bashrc"
	EOH
end