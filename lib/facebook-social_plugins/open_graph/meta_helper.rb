module FacebookSocialPlugins
	module OpenGraph
		module MetaHelper
			def fb_og_header name, namespace, &block
				content = capture(&block)
				content_tag :head, content, :prefix => "og: http://ogp.me/ns# og_#{name}: http://ogp.me/ns/apps/#{namespace}x#"
			end

			def fb_og_app_id app_id
				content_tag :meta, '', :property => "fb:app_id", :content => app_id
			end

			def fb_og_type namespace, object_type
				content_tag :meta, '', :property => "og:type", :content => "#{namespace}:#{object_type}"
			end

			def fb_og_title title
				content_tag :meta, '', :property => "og:title", :content => title
			end

			def fb_og_image href
				content_tag :meta, '', :property => "og:image", :content => href
			end

			def fb_og_desc desc
				content_tag :meta, '', :property => "og:description", :content => desc
			end

			def fb_og_url href
				content_tag :meta, '', :property => "og:url", :content => href
			end

			def fb_og_meta name, namespace, app_id, object_type, options = {}
				content = fb_og_app_id(app_id) + fb_og_type(namespace, object_type)
				content << fb_og_title(options[:title]) if options[:title]
				content << fb_og_image(options[:img]) if options[:img]
				content << fb_og_image(options[:desc]) if options[:desc]
				content << fb_og_image(options[:url]) if options[:url]				
				fb_og_header(name, namespace) do
					content
				end
			end			
		end
	end
end
