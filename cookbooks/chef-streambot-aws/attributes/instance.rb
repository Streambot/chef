default[:aws_instance] = {
	:role 	=> "",
	:env 	=> ""
}
default[:collect][:graphite_host] = "localhost"

# Define startup scripts to be installed
# Order is important here!
default[:hostname_script] = "/etc/update-hostname.sh"
default[:startup_scripts]["1"] = default[:hostname_script]

default[:aws_tags_script] = "/etc/update-aws-tags.sh"
default[:startup_scripts]["2"] = default[:aws_tags_script]

