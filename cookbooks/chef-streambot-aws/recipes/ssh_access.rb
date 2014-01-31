node.ssh_access.ssh.each do |user, config|

	configauthorized_keys.each do |key|
		file = "#{config.home}/.ssh/authorized_keys"
	    execute "if ! grep -q '#{key}' #{file} ; then echo '#{key}' >> #{file}; fi;"
	end


	unless config.private_key.nil?
		bash "install_private_key_for_user_#{user}" do
			user 	user
			cwd		config.home
			code 	<<-EOH
				echo "#{config.private_key}" > .ssh/id_rsa
				chmod 700 .ssh/id_rsa
			EOH
		end
	end

	unless config.public_key.nil?
		bash "install_public_key_for_user_#{user}" do
			user 	user
			cwd		config.home
			code 	<<-EOH
				echo "#{config.public_key}" > .ssh/id_rsa.pub
			EOH
		end
	end

end