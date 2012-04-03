module FacebookSocialPlugins
	# Also see AddToTimeline.txt of this gem for example of using OpenGraph with this feature.
	class AddToTimeline < SocialPlugin
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-add-to-timeline'
		end

		# mode - the display mode - box (default) and button
		# show_faces - whether to show faces
		def attributes
			super.merge(:show_faces => :boolean, :mode => ['box', 'button'])
		end
	end
end
