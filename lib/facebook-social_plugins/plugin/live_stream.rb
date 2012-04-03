module FacebookSocialPlugins::Plugin
	class LiveStream < Social
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-live-stream'
		end

		# event-app-id - the app id for the event
		# width - the width of the plugin in pixels. Minimum recommended width: 400px.
		# height - the height of the plugin in pixels. Minimum recommended height: 200px.
		# always-post-to-friends - whether to always post to friend, default: false
		def attributes
			super.merge(:'via-url' => :string, :xid => :string, :'event-app-id' => :string, 
				:height => :integer, :'always-post-to-friends' => :boolean, :width => :integer)
		end
	end
end

