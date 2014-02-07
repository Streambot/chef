normal["go"] = {
	:version => "1.2",
	:scm => true,
	:binary => "/usr/local/go/bin/go",
	:gopath => "/opt/go",
	:packages => [
		"github.com/mattn/gom"
	]
}
default["gom_packages"] = {
	"code.google.com/p/go-uuid/uuid" => {},
	"github.com/mbiermann/go-rexster-client" => {},
	"github.com/op/go-logging" => {},
	"github.com/laurent22/ripple" => {},
	"github.com/jessevdk/go-flags" => {}
}