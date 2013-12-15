### Setup Amazon S3 access

# Install the s3cmd package used by scripts and jobs
package "s3cmd"

# Install the s3cmd configuration file from template
template '/home/ubuntu/.s3cfg' do
	source "s3cfg.erb"
	mode 0755
	owner "ubuntu"
	group "ubuntu"
	variables({
		:access_key => node[:aws][:s3][:access_key],
		:secret_key => node[:aws][:s3][:secret_key]
	})
end