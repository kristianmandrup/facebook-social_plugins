module FacebookSocialPlugins
	class Analytics < UiHelper
		attr_reader :app_id

		def initialize app_id
			@app_id = app_id
		end

		def render
			content_tag :meta, '', :property => "fb:admins", :content => app_id
		end
	end
end
