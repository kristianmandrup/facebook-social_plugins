module FacebookSocialPlugins
	module ScriptHelper

		# app_id - facebook app id, a number/string, fx '753632322'
		# domain - fx www.example.com
		# options - status, cookie, xfbml (true|false)
		# - :channel => 'channel.html'
		def async_init_script app_id, domain, options = {}
			%Q{
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '#{app_id}', // App ID
      channelUrl : '//#{domain}/#{options[:channel] || 'assets/facebook_channel'}.html', // Channel File
      status     : #{options[:status] || true}, // check login status
      cookie     : #{options[:cookie] || true}, // enable cookies to allow the server to access the session
      xfbml      : #{options[:xfbml] || true }  // parse XFBML
    });

    // Additional initialization code here
  };
}
		 end			

		def facebook_script locale = :en_US
			%Q{
(function(d){
   var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "#{all_script locale}";
   d.getElementsByTagName('head')[0].appendChild(js);
 }(document));
}
		end

		protected

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