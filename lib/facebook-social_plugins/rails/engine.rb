module FacebookSocialPlugins
	module Rails
		class Engine < ::Rails::Engine
			initializer 'setup rails' do				
				FacebookSocialPlugins.helpers.each do |helper|
					ActionView::Base.send :include, "FacebookSocialPlugins::Helper::#{helper.to_s.camelize}".constantize
				end
			end
		end
	end
end