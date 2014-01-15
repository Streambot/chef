override["go"] = {
	:version => "1.2",
	:scm => true,
	:binary => "/usr/local/go/bin/go",
	:gopath => "/opt/go",
	:packages => [
		"github.com/hoisie/web",
		"code.google.com/p/go-uuid/uuid",
		"github.com/sqs/go-rexster-client",
		"code.google.com/p/gorest"
	]
}