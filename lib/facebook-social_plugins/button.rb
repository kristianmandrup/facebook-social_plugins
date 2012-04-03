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
			super.merge(:font => fonts, :colorscheme => colorschemes)
		end
	end
end
