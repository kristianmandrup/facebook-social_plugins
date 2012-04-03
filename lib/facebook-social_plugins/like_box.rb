module FacebookSocialPlugins
	class LikeBox < SocialPlugin
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-like-box'
		end

			# href - the URL of the Facebook Page for this Like Box
			# width - the width of the plugin in pixels. Default width: 300px.
			# height - the height of the plugin in pixels. The default height varies based on number of faces to display, and whether the stream is displayed. With the stream displayed, and 10 faces the default height is 556px. With no faces, and no stream the default height is 63px.
			# colorscheme - the color scheme for the plugin. Options: 'light', 'dark'
			# show_faces - specifies whether or not to display profile photos in the plugin. Default value: true.
			# stream - specifies whether to display a stream of the latest posts from the Page's wall
			# header - specifies whether to display the Facebook header at the top of the plugin.
			# border_color - the border color of the plugin.
			# force_wall - for Places, specifies whether the stream contains posts from the Place's wall or just checkins from friends. Default value: false.			

		def attributes 
			super.merge(
				:href => :string, :height => :integer, :stream => :boolean, :header => :string,
				:show_faces => :boolean, :force_wall => :boolean, :width => :integer
			)
		end
	end
end