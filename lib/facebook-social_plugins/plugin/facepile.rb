module FacebookSocialPlugins::Plugin
	class Facepile < Social
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-facepile'
		end

		# event-app-id - the app id for the event
		# action - the action to perform, fx 'og_recipebox:planning_to_make'
		# width - the width of the plugin in pixels. Minimum recommended width: 400px.
		# href - the referenced page
		# max_rows - max rows to display, 1-10 normally
		def attributes
			super.merge(:'event-app-id' => :string, :action => :string, :href => :string, 
				:max_rows => :integer, :size => sizes, :width => :integer
			)
		end
	end
end
