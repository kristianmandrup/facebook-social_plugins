module FacebookSocialPlugins
	module OpenGraph
		module MetaHelper
			def og_header name, namespace, &block
				content = capture(&block)
				content_tag :head, content, :prefix => "og: http://ogp.me/ns# og_#{name}: http://ogp.me/ns/apps/#{namespace}x#"
			end

			def fb_app_id app_id
				content_tag :meta, '', :property => "fb:app_id", :content => app_id
			end

			def og_type namespace, object_type
				content_tag :meta, '', :property => "og:type", :content => "#{namespace}:#{object_type}"
			end

			def og_title title
				content_tag :meta, '', :property => "og:title", :content => title
			end

			def og_image href
				content_tag :meta, '', :property => "og:image", :content => href
			end

			def og_desc desc
				content_tag :meta, '', :property => "og:description", :content => desc
			end

			def og_url href
				content_tag :meta, '', :property => "og:url", :content => href
			end

			def open_graph_meta name, namespace, app_id, object_type, options = {}
				content = fb_app_id(app_id) + og_type(namespace, object_type)
				content << og_title(options[:title]) if options[:title]
				content << og_image(options[:img]) if options[:img]
				content << og_image(options[:desc]) if options[:desc]
				content << og_image(options[:url]) if options[:url]				
				og_header(name, namespace) do
					content
				end
			end			
		end
	end
end
