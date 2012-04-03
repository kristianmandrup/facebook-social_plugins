module FacebookSocialPlugins::Plugin
	class LoginButton < Social
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-login-button'
		end

		# show-faces - specifies whether to show faces underneath the Login button.
		# width - the width of the plugin in pixels. Default width: 200px.
		# max-rows - the maximum number of rows of profile pictures to display. Default value: 1.
		# scope - a comma separated list of extended permissions. 
		# 				By default the Login button prompts users for their public information. 
		#  				If your application needs to access other parts of the user's profile that may be 
		#					private, your application can request extended permissions. 
		def attributes
			super.merge(:'show-faces' => :boolean, :'max-rows' => :integer, :scope => :array, :width => :integer)
		end
	end
end



