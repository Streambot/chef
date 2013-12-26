include_recipe "jenkins::server"
include_recipe "setup-jenkins::s3"
include_recipe "setup-jenkins::thin_backup"
include_recipe "setup-jenkins::backup_s3_upload"