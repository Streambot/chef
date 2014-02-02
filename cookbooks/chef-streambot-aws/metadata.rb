name              "chef-streambot-aws"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Provides additional material for provisioning Streambot Cloud Services machines in the Amazon Web Services"
version           "0.0.1"

recipe "chef-streambot-aws::access", "Installs public SSH keys to the authorized keys pool"
recipe "chef-streambot-aws::instance", "Installs instance-specific information/dependencies"

depends "collectd-write-graphite" # commit baa3f0487cd4dd601ecd722cae343a1b402f34f5