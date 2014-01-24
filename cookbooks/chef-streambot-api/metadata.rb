name              "chef-streambot-api"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Streambot API server"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "chef-streambot-api::default", "Installs Streambot APi server"

depends "chef-streambot-scm-access"
depends "chef-streambot-aws"
depends "golang"
depends "chef-golang"
depends "statsd"