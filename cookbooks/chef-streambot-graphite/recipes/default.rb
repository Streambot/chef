include_recipe "graphite"

jsFile 	= "/opt/graphite/webapp/content/js/composer_widgets.js"
freq 	= node[:graphite][:dashboard_refresh_freq] || 1

bash "speedup_dashboard_refresh_to_1sec_freq" do
	code <<-EOH
		rm -rf /opt/graphite/storage/whisper/stats*
		echo "MEMCACHE_DURATION = #{freq}" >> /opt/graphite/webapp/graphite/local_settings.py
		mv #{jsFile} #{jsFile}.old
		sed "s/var interval = [^;]*;/var interval = #{freq};/" #{jsFile}.old > #{jsFile}
		rm #{jsFile}.old
	EOH
end