include_recipe "golang"
include_recipe "chef-golang"
include_recipe "golang::packages"

bash "load_etc_profile_on_interactive_shells" do
	user	:root
	cwd		"/tmp"
	code 	<<-EOH
	echo "if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi" >> /etc/bash.bashrc
	EOH
end