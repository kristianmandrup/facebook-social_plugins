module FacebookSocialPlugins
	class SendButton < Button
		def initialize options = {}
			super
		end

		def button_class
			'fb-send'
		end

		# href - the URL to send.
		# font - the font to display in the button. Options: 'arial', 'lucida grande', 'segoe ui', 'tahoma', 'trebuchet ms', 'verdana'
		# colorscheme - the color scheme for the button. Options: 'light', 'dark'
		# ref - a label for tracking referrals; must be less than 50 characters and can contain alphanumeric characters and some punctuation (currently +/=-.:_). The ref attribute causes two parameters to be added to the referrer URL when a user clicks a link from a stream story about a Send action:
		# fb_ref - the ref parameter
		# fb_source - the story type ('message', 'group', 'email') in which the click occurred.
		def attributes
			super.merge(:href => :string, :ref => :string, :fb_ref => :string, :fb_source => ['message', 'group', 'email'])
		end
	end
end

