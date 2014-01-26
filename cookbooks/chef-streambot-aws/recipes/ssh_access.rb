node.ssh_access.ssh.authorized_keys.each do |key|
	file = "#{node.ssh_access.ssh.user_home}/.ssh/authorized_keys"
    execute "if ! grep -q '#{key}' #{file} ; then echo '#{key}' >> #{file}; fi;"
end