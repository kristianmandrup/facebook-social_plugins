module FacebookSocialPlugins
	class Comments < SocialPlugin
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-comments'
		end

		# href - the URL for this Comments plugin. News feed stories on Facebook will link to this URL.
		# width - the width of the plugin in pixels. Minimum recommended width: 400px.
		# colorscheme - the color scheme for the plugin. Options: 'light', 'dark'
		# num_posts - the number of comments to show by default. Default: 10. Minimum: 1
		# mobile - whether to show the mobile-optimized version. Default: auto-detect.
		def attributes
			super.merge(:href => :string, :num_posts => :integer, :mobile => :boolean, :width => :integer)
		end
	end
end
