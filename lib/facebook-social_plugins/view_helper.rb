module FacebookSocialPlugins
	module ViewHelper
		def fb_root
			content_tag :div, :class => "fb-root"
		end

		def fb_activity_feed options = {}
			FacebookSocialPlugins::ActivityFeed.new(options).render
		end

		def fb_add_to_timeline options = {}
			FacebookSocialPlugins::AddToTimeline.new(options).render
		end

		def fb_comments options = {}
			FacebookSocialPlugins::Comments.new(options).render
		end

		def fb_facepile options = {}
			FacebookSocialPlugins::Facepile.new(options).render
		end

		def fb_like_box options = {}
			FacebookSocialPlugins::LikeBox.new(options).render
		end

		def fb_like_button options = {}
			FacebookSocialPlugins::LikeButton.new(options).render
		end

		def fb_live_stream options = {}
			FacebookSocialPlugins::LiveStream.new(options).render
		end

		def fb_login_button options = {}
			FacebookSocialPlugins::LoginButton.new(options).render
		end

		def fb_recommendations_box options = {}
			FacebookSocialPlugins::RecommendationsBox.new(options).render
		end

		def fb_registration options = {}
			FacebookSocialPlugins::Registration.new(options).render
		end

		def fb_send_button options = {}
			FacebookSocialPlugins::SendButton.new(options).render
		end

		def fb_subscribe_button options = {}
			FacebookSocialPlugins::SubscribeButton.new(options).render
		end
	end
end
