node.access.ssh.authorized_keys.each do |key| 
	bash "echo '#{key}' >> ~/.ssh/authorized_keys"
end