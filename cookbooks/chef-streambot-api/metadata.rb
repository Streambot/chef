name              "streambot-api"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Streambot API server"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "streambot-api", "Installs Streambot APi server"

depends "golang"
depends "chef-golang"