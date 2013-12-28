node.access.ssh.authorized_keys.each do |key|
        bash "add_ssh_authorized_key" do
                user node.access.ssh.user
                code "echo '#{key}' >> ~/.ssh/authorized_keys"
        end
end