bash "install_go" do
	user "root"
	cwd "/tmp"
	code <<-EOH
		echo '
		export GOROOT=/usr/local/go
		export PATH=$PATH:$GOROOT/bin
		export GOPATH="/root/gocode"' >> ~/.bashrc 
		wget https://go.googlecode.com/files/go1.1.2.linux-386.tar.gz
		tar xvfz go1.1.2.linux-386.tar.gz
		mv go /usr/local/go
		cd /usr/local/go/src
		./all.bash
	EOH
end