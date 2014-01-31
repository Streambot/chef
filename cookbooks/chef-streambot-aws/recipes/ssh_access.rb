node.ssh_access.ssh.authorized_keys.each do |key|
	file = "#{node.ssh_access.ssh.user.home}/.ssh/authorized_keys"
    execute "if ! grep -q '#{key}' #{file} ; then echo '#{key}' >> #{file}; fi;"
end


unless node.ssh_access.ssh.user.private_key.nil?
	bash "install_private_key_for_user_#{node.ssh_access.ssh.user.name}" do
		user 	node.ssh_access.ssh.user.name
		cwd		node.ssh_access.ssh.user.home
		code 	<<-EOH
			echo "#{node.ssh_access.ssh.user.private_key}" > .ssh/id_rsa
		EOH
	end
end

unless node.ssh_access.ssh.user.public_key.nil?
	bash "install_public_key_for_user_#{node.ssh_access.ssh.user.name}" do
		user 	node.ssh_access.ssh.user.name
		cwd		node.ssh_access.ssh.user.home
		code 	<<-EOH
			echo "#{node.ssh_access.ssh.user.public_key}" > .ssh/id_rsa.pub
		EOH
	end
end