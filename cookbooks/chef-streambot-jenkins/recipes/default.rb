include_recipe "jenkins::java"
include_recipe "jenkins::master"
include_recipe "chef-streambot-jenkins::s3"
include_recipe "chef-streambot-jenkins::thin_backup"
include_recipe "chef-streambot-jenkins::backup_s3_upload"
include_recipe "chef-streambot-jenkins::build_ami"