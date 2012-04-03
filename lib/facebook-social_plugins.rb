require 'facebook-social_plugins/button'

require 'facebook-social_plugins/analytics'
require 'facebook-social_plugins/open_graph/meta_helper'

module FacebookSocialPlugins
	def self.plugins
		['activity_feed', 'add_to_timeline', 'comments', 'facepile', 'like_box', 'like_button',
			'live_stream', 'login_button', 'recommendations_box', 'registration', 'send_button', 'subscribe_button']
	end

	def self.helpers
		['script', 'view']
	end
end

FacebookSocialPlugins.plugins.each do |name|
	require "facebook-social_plugins/#{name}"
end

FacebookSocialPlugins.helpers.each do |name|
	require "facebook-social_plugins/#{name}_helper"
end

require 'facebook-social_plugins/rails/engine' if defined?(::Rails::Engine)