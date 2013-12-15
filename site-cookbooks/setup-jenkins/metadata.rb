name              "setup-jenkins"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "BSD"
description       "Configures a Jenkins CI for the Streambot Cloud"
version           "0.0.1"

recipe "setup-jenkins", "Installs Jenkins plugins and sets up configuration files"

depends "jenkins"