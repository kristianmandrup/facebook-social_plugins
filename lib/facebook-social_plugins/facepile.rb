module FacebookSocialPlugins

	# The Facepile plugin displays the Facebook profile pictures of users who have connected with your 
	# page via a global or custom action, or can also be configured to display users that have 
	# signed up for your site.

	# If you want to display users who have connected to your page via an action, specify with the action parameter

	# <div class="fb-facepile" data-href="http://developers.facebook.com" 
	# 	data-action="join" data-size="large" data-max-rows="1" data-width="300" 
	# 	data-colorscheme="dark">
	# </div>	

	# To display users who have liked your page, specify the URL of your page as the href parameter. 
	# To display users who have signed up for your site, specify your application id as the app_id

	class Facepile < SocialPlugin
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
			super.merge(:app_id => :string, :action => :string, :href => :string, 
				:max_rows => :integer, :size => ['small', 'large'], :width => :integer
			)
		end
	end
end
