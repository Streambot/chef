node.ssh_access.each do |user, config|

	if !config[:authorized_keys].nil? and !config.authorized_keys.empty?
		config.authorized_keys.each do |key|
			file = "#{config.home}/.ssh/authorized_keys"
		    execute "if ! grep -q '#{key}' #{file} ; then echo '#{key}' >> #{file}; fi;"
		end
	end


	if !config[:private_key].nil? && !config.private_key.empty?
		bash "install_private_key_for_user_#{user}" do
			user 	user
			cwd		config.home
			code 	<<-EOH
				echo "#{config.private_key}" > .ssh/id_rsa
				chmod 700 .ssh/id_rsa
			EOH
		end
	end

	if !config[:public_key].nil? && !config.public_key.empty?
		bash "install_public_key_for_user_#{user}" do
			user 	user
			cwd		config.home
			code 	<<-EOH
				echo "#{config.public_key}" > .ssh/id_rsa.pub
			EOH
		end
	end

end