##############################################################################
# Install test's user
##############################################################################

group node[:streambot_test][:user][:group]

user node[:streambot_test][:user][:name] do
	comment		'Streambot Test user (ssh)'
	gid 		node[:streambot_test][:user][:group]
	home 		node[:streambot_test][:user][:home]
	shell 		node[:streambot_test][:user][:shell]
end


################################################################################
# Clone the Streambot API server source control repository
################################################################################

scm = node[:streambot_test][:scm]

git node[:streambot_test][:home] do
  repository 	scm[:git_repository]
  reference 	scm[:git_revision]
  user 			scm[:user][:name]
  group 		scm[:user][:group]
  action 		:sync
end


##############################################################################
# Install test's configuration
##############################################################################

template "#{node[:streambot_test][:home]}/config.json"  do
	source "config.json.erb"
	owner node[:streambot_test][:user][:name]
	mode 0744
	variables(node[:streambot_test][:config])
end