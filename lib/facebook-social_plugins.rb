require 'facebook-buttons/social_plugin'
require 'facebook-buttons/button'

module FacebookButtons
	def self.available
		['activity_feed', 'add_to_timeline', 'comments', 'facepile', 'like_box', 'like_button', 
			'live_stream', 'login_button', 'recommendations_box', 'registration', 'send_button', 'subscribe_button']
	end

	def self.helpers
		['script', 'view']
end

FacebookButtons.available_buttons.each do |name|
	require "facebook-buttons/#{name}"
end

FacebookButtons.available_helpers.each do |name|
	require "facebook-buttons/#{name}_helper"
end

require 'facebook-buttons/rails/engine'