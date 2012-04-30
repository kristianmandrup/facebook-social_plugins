module FacebookSocialPlugins::Helper
	module Script

		# can be used inside a js.erb file or similar
		def fb_login_click_react options = {:selector => '#fb_login'}, &block
			selector = options[:selector] || '#fb_login'
			block_content = yield if block
			on_success = options[:on_success] || block_content || '// on success'
			on_fail = options[:on_fail] || '// on failure'

			script = %Q{$('#{selector}').click(function() { 
		#{fb_login_react(options, &block)}
		return false;
  }
}				
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_login_react options = {}, &block
			block_content = yield if block
			on_success = options[:on_success] || block_content || '// on success'
			on_fail = options[:on_fail] || '// on failure'

			script = %Q{FB.login(function(response) { 
		if (response.authResponse) {
			#{on_success}
		} else {
			#{on_fail}
		}			
	}#{scope_permissions options[:scope]}); 
}
			options[:ready] ? wrap_ready(script) : script
		end


		def fb_logout_click_react options = {:selector => '#fb_logout'}, &block
			selector 	= options[:selector] || '#fb_logout'
			block_content = yield if block
			on_done 	= options[:on_done] || block_content || '// on done'
			script = %Q{$('#{selector}').click(function() { 
		#{fb_logout_react(:on_done => on_done)}
		return false;
 	}
}				
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_logout_react options = {}, &block
			block_content = yield if block
			on_done = options[:on_done] || block_content || '// on done'

			script = %Q{FB.logout(function(response) { 
		#{on_done}
	});
}
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_onlogout_redirect_to path, options = {}
			script = %Q{FB.Event.subscribe("auth.logout", function() { 
	window.location = '#{path}' 
	}); 
}
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_onlogout_react options = {}, &block
			block_content = yield if block
			reaction = options[:reaction] || block_content || ' // on logout'
			script = %Q{FB.Event.subscribe("auth.logout", function() { 
		#{reaction} 
	});
}
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_onlogin_redirect_to path, options = {}
			script = %Q{FB.Event.subscribe("auth.login", function() { 
	window.location = '#{path}' 
	}); 
}
			options[:ready] ? wrap_ready(script) : script
		end

		def fb_onlogin_react options = {}, &block
			block_content = yield if block
			reaction = options[:reaction] || block_content || ' // on login'
			script = %Q{FB.Event.subscribe("auth.login", function() { 
		#{reaction} 
	});
}
			options[:ready] ? wrap_ready(script) : script
		end


		# app_id - facebook app id, a number/string, fx '753632322'
		# domain - fx www.example.com
		# options - status, cookie, xfbml (true|false)
		# - :channel => 'channel.html'
		def fb_async_init_script app_id, domain, options = {}
			raise ArgumentError, "Not a valid Facebook App ID. It should be a 15 digit number" unless valid_facebook_id?(app_id)
			raise ArgumentError, "No domain name specified" if domain.blank?

			if options[:channel] || options[:channel_url]
				locale = options[:locale] || I18n.locale
				channel = options[:channel_url] || "assets/facebook_channel_#{locale}" 
				channelAttrib = "channelUrl : '//#{domain}/#{channel}.html', // Channel File"
			else
				channelAttrib = '// No Facebook channel defined (use fx #fb_channel_script)'
			end
			%Q{
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '#{app_id}', // App ID    
      #{channelAttrib}
      status     : #{options[:status] || true}, // check login status
      cookie     : #{options[:cookie] || true}, // enable cookies to allow the server to access the session
      xfbml      : #{options[:xfbml] || true }  // parse XFBML
    });

    // Additional initialization code here
  };
}
		 end			

		def valid_facebook_id? id
			id ~= /\d{15}/
		end

		def fb_channel_script locale = :en_US
			%Q{
(function(d){
   var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
   js 			= d.createElement('script'); 
   js.id 		= id; 
   js.async = true;
   js.src 	= '#{all_script(locale)}';
   d.getElementsByTagName('head')[0].appendChild(js);
 }(document));
}
		end

		protected

		def scope_permissions scope
			scopes = case scope
			when Array
				scope.join(',')
			when String
				scope
			else
				nil
			end
			scopes ? ", {scope: '#{scopes}'}" : ''
		end			

		def wrap_ready script
			%Q{$(function() {
		#{script}
	}
}
		end

		# The JavaScript SDK is available in all locales that are supported by Facebook. 
		# This list of supported locales is available as an XML file. 
		# To change the locale of the SDK to match the locale of your site, change en_US to a 
		# supported locale code when loading the SDK. 
		# For example, if your site is in Spanish use es_LA


		def all_script locale = :en_US
			"//connect.facebook.net/#{locale}/all.js"
		end
	end
end
