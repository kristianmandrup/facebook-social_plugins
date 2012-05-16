# Facebook Social plugins

The Facebook Social plugins for Rails 3 consist of:

* Helper::View
* Helper::Script
* Helper::OpenGraph - see [opengraph](https://developers.facebook.com/docs/opengraph/)

The `Helper::View` contains methods for inserting the HTML5 `<div>` elements for Facebook social plugins

The `Helper::Script` contains methods for inserting `<script>` snippets for Facebook integration, such as displaying the Social plugins with the Facebook layout/styling applied etc.

## Social plugins

Currently the following Social plugins are included in this gem

* Root
* Activity Feed
* Comments
* Facepile
* Like Box
* Like Button
* Live Stream
* Login Button
* Recommendations Box
* Registration
* Send Button
* Subscribe Button

(see more info below)

## Script Helpers

* async_init_script(app_id, domain, options = {})
* facebook_script(locale = :en)

The async_init_script requires the Facebook app_id, fx '753632322' and the domain name of the app, fx 'www.example.com'. You can also specify the channel file (will default to channel file in `vendor/assets` of this gem)

### Configuration scripts

* fb_async_init_script(app_id, domain)
* fb_channel_script(locale = :en_US)

### Login

* fb_login_click_react(options, &block)
* fb_login_react(options, &block)
* fb_onlogin_react(options, &block)
* fb_onlogin_redirect_to(path, options)

### Logout

* fb_logout_click_react(options, &block)
* fb_logout_react(options, &block)
* fb_onlogout_react(options, &block)
* fb_onlogout_redirect_to(path, options)

* fb_login_and_react(options = {:selector => '#fb_login_and_reload'})
* fb_logout_and_redirect_to(path, options = {:ready => false})

## Open Graph Helper

Convenience method to generate all header/meta tags for Facebook Open Graph

* open_graph_meta(name, namespace, app_id, object_type, options = {})

* `<head>` tag helper*

* og_header(name, namespace)

* `<meta>` tag helpers*

* og_type(app_id, object_type)
* og_title(title)
* og_image(image_url)
* og_url(href)
* og_desc(desc)
* fb_app_id(app_id)

## Extra View helpers

* fb_analytics(app_id) # Facebook analytics meta tag
* fb_activity(namespace, action) # Open Graph action to perform

* fb_onlogout(script) # setup FB event handler to trigger on FB logout
* fb_onlogout_redirect_to(path) # setup FB event handler to trigger on FB logout and redirect

## Social plugins

Currently the following Social plugins are included in this gem

* Root
* Activity Feed
* Comments
* Facepile
* Like Box
* Like Button
* Live Stream
* Login Button
* Recommendations Box
* Registration
* Send Button
* Subscribe Button

View methods exposed:

* fb_root
* fb_activity options = {}
* fb_add_to_timeline options = {}
* fb_comments options = {}
* fb_facepile options = {}
* fb_like_box (options= {}
* fb_like_button options = {}
* fb_live_stream options = {}
* fb_login_button options = {}
* fb_recommendations_box options = {}
* fb_registration options = {}
* fb_send_button options = {}
* fb_subscribe_button options = {}

Note: You don't have to worry about dashed or underscored properties. Conversions will be handled automatically. The Facebook Social plugins API is (sadly) not very consistent when it comes to attribute names.

Extras:

* fb_logout_button(options = {}) # renders logout button (english only)

Logout button options: 
html: (html options for anchor tag)
size: 'small' or 'large' (size of logout button img)

## Contributing to facebook-social_plugins
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Kristian Mandrup. See LICENSE.txt for
further details.

