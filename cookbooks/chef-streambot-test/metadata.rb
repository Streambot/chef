name              "chef-streambot-test"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Streambot Test client"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "chef-streambot-test::default", "Installs Streambot client"

depends "apt"
depends "chef-streambot-scm-access"
depends "chef-streambot-aws"
depends "golang"
depends "chef-golang"
depends "statsd"