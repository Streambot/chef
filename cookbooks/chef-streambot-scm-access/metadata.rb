name              "chef-streambot-scm-access"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Installs SSH credentials for Streambot SCM access"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "chef-streambot-scm-access::default", "Installs SSH credentials for SCM access"