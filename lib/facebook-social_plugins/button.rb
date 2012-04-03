module FacebookSocialPlugins
	class Button < SocialPlugin
		def initialize options = {}
			super
		end

		# attributes always availabe for a button?
		def attributes
			super.merge({:font => :string, :colorscheme => ['light', 'dark']})
		end
	end
end
