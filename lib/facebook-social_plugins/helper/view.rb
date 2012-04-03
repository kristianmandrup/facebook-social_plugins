module FacebookSocialPlugins::Helper
	module View
		def fb_root
			content_tag :div, '', :class => "fb-root"
		end

		def fb_analytics app_id
			content_tag :meta, '', :property => "fb:admins", :content => app_id
		end		

		def fb_activity namespace, action
			content_tag :div, '', :class => "fb-activity", :'data-actions' => "#{namespace}:#{action}"
		end		

		FacebookSocialPlugins.plugins.each do |name|
			define_method :"fb_#{name}" do |options = {}|
				FacebookSocialPlugins.plugin name, options				
			end
		end

		def fb_logout_button options = {}
			content_tag :a, '', {:id => 'fb_logout_and_reload', :href => '#'}.merge(options[:html] || {}) do
				content_tag(:img, '', :id => 'fb_logout_image', :src => "/assets/fb_logout_#{options[:size] || :small}.gif", :alt => "Facebook Logout").html_safe
			end
		end
	end
end