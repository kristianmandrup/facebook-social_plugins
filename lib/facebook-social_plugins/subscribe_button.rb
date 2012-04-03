module FacebookSocialPlugins
	class SubscribeButton < Button
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-subscribe'
		end

		# href - profile URL of the user to subscribe to. This must be a facebook.com profile URL.
		# layout - there are three options.
			# standard - displays social text to the right of the button and friends' profile photos below. Minimum width: 225 pixels. Default width: 450 pixels. Height: 35 pixels (without photos) or 80 pixels (with photos).
			# button_count - displays the total number of subscribers to the right of the button. Minimum width: 90 pixels. Default width: 90 pixels. Height: 20 pixels.
			# box_count - displays the total number of subscribers above the button. Minimum width: 55 pixels. Default width: 55 pixels. Height: 65 pixels.
		# show_faces - specifies whether to display profile photos below the button (standard layout only)
		# colorscheme - the color scheme for the plugin. Options: 'light' (default) and 'dark'
		# font - the font to display in the plugin. Options: 'arial', 'lucida grande', 'segoe ui', 'tahoma', 'trebuchet ms', 'verdana'
		# width - the width of the plugin.		
		def attributes
			super.merge(:href => :string, :layout => layouts, 
				:show_faces => :boolean, :width => :integer)
		end
	end
end


