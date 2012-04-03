module FacebookSocialPlugins
	module Rails
		class Engine < ::Rails::Engine
			initializer 'setup rails' do				
				ActionView::Base.send :include, FacebookSocialPlugins::ViewHelper
				ActionView::Base.send :include, FacebookSocialPlugins::ScriptHelper
			end
		end
	end
end