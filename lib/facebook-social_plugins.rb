module FacebookSocialPlugins
	module Helper
	end

	module Plugin
	end

	def self.plugins
		[
			'activity_feed', 'add_to_timeline', 'comments', 'facepile', 
			'like_box', 'like_button', 'live_stream', 'login_button', 'recommendations_box', 
			'registration', 'send_button', 'subscribe_button'
		]
	end

	def self.all_plugins
		['ui_helper', 'social', 'button'] + plugins
	end

	def self.helpers
		['script', 'view', 'open_graph']
	end

	def self.plugin name, options = {}
		klass = "FacebookSocialPlugins::Plugin::#{name.to_s.camelize}".constantize
		klass.new(options).render
	end
end

FacebookSocialPlugins.all_plugins.each do |name|
	require "facebook-social_plugins/plugin/#{name}"
end

FacebookSocialPlugins.helpers.each do |name|
	require "facebook-social_plugins/helper/#{name}"
end

require 'facebook-social_plugins/rails/engine' if defined?(::Rails::Engine)