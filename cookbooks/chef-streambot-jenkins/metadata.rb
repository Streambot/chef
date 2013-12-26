name              "streambot-jenkins"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Jenkins CI for the Streambot Cloud"
version           "0.0.1"

recipe "streambot-jenkins", "Installs Jenkins plugins and sets up configuration files"

depends "jenkins"