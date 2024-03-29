name              "chef-streambot-jenkins"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Jenkins CI for the Streambot Cloud"
version           "0.0.1"

recipe "chef-streambot-jenkins::default", "Installs Jenkins plugins and sets up configuration files"

depends "chef-streambot-scm-access"
depends "chef-streambot-aws"
depends "jenkins", "2.0.2"
depends "aws_developer_tools"