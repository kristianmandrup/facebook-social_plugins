module FacebookSocialPlugins::Plugin
	class Button < Social
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
