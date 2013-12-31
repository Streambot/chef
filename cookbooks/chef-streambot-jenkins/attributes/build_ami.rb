default[:build_ami] = {
	:aws => {
		:access_key => "",
		:secret_key => "",
		:keypair => {
			:file => "",
			:name => ""
		},
		:base_ami => ""
	},
	:deployment_repo => "",
	:chef_repo => {
		:url 	=> "",
		:branch => ""
	},
	:user => {
		:name	=> "",
		:group 	=> ""
	}
}