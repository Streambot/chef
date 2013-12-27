script_location = "/opt/upload_jenkins_backup.sh"

# Install the backup upload script from template
template script_location do
  source "upload_jenkins_backup.sh.erb"
  mode 0755
  owner "ubuntu"
  group "ubuntu"
  variables({
    :s3_backup_bucket_uri => node[:aws][:s3_backup_bucket_uri]
  })
end

# Register the upload script in crontab to have it executed once every hour (at minute '30 to 
# prevent collision with actual backup from Jenkins)
cron "jenkins_backup_s3_upload" do
  command script_location
  minute "30"
  hour "*"
  day "*"
  month "*"
  weekday "*"
  user "ubuntu"
  action :create
end