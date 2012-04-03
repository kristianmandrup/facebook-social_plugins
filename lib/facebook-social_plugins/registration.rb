module FacebookSocialPlugins
	class Registration < SocialPlugin
		attr_reader :named_fields

		# <fb:registration 
		#   fields="name,birthday,gender,location,email" 
		#   redirect-uri="https://developers.facebook.com/tools/echo/"
		#   width="530">
		# </fb:registration>		

		def initialize options = {}
			super
			@named_fields = options[:fields]
		end

		def plugin_class
			'fb-registration'
		end

		# client_id	Your App ID.
		# redirect_uri	The URI that will process the signed_request. It must be prefixed by your Site URL.
		# fields	Comma separated list of Named Fields, or JSON of Custom Fields.
		# fb_only	Optional. (boolean) Only allow users to register by linking their Facebook profile. Use this if you do not have your own registration system. Default: false.
		# fb_register	Optional. (boolean) Allow users to register for Facebook during the registration process. Use this if you do not have your own registration system. Default: false.
		# width	Optional. (int) The width of the iframe in pixels. If the width is < 520 the plugin will render in a small layout.
		# border_color	Optional. The border color of the plugin.
		# target	Optional. The target of the form submission: _top (default), _parent, or _self.
		def attributes
			super.merge(:client_id => :string, :redirect_uri => :string, :fields => :string, 
				:fb_only => :boolean, :fb_register => :boolean, :border_color => :string, :target => ['_top', '_parent', '_self']
			)
		end

		# Named Fields

		# Specify these in the order you want them to appear in the form. The name field must always be the first field.

		# Field type	Description
		# name	Full name of the user
		# birthday	Returned as mm/dd/yyyy
		# email	Email address of user (if the user registers with her Facebook account, this will be a verified email address)
		# gender	Gender of user
		# location	Name and ID of the user's current city
		# password	A newly created password (not their Facebook password)
		# captcha	A test to stop automatic registration
		# Less common fields:

		# Field type	Description
		# first_name	The first name of the user. Useful with view=not_prefilled.
		# last_name	The last name of the user.
	end
end