require 'facebook-social_plugins/social_plugin'

module FacebookSocialPlugins
	class Button < SocialPlugin
		def initialize options = {}
			super
		end

		def plugin_class
			super
		end

		# attributes always availabe for a button?
		def attributes
			super.merge(:font => ['arial', 'lucida grande', 'segoe ui', 'tahoma', 'trebuchet ms', 'verdana'], :colorscheme => ['light', 'dark'])
		end
	end
end
