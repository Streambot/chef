name              "chef-streambot-graphite"
maintainer        "Martin Biermann"
maintainer_email  "info@martinbiermann.com"
license           "MIT"
description       "Configures a Graphite server for the Streambot Cloud"
version           "0.0.1"

recipe "chef-streambot-graphite::default", "Installs Graphite and alters dashboard refresh frequency"

depends "graphite"