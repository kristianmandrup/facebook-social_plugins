module FacebookSocialPlugins::Plugin
	class ActivityFeed < Social
		def initialize options = {}
			super
		end

		def plugin_class
			'fb-activity'
		end

		# site - the domain for which to show activity; include just the full domain name, without http:// or a path. The XFBML version defaults to the current domain.
		# action - a comma separated list of actions to show activities for.
		# app_id - will display all actions, custom and global, associated with this app_id.
		# width - the width of the plugin in pixels. Default width: 300px.
		# height - the height of the plugin in pixels. Default height: 300px.
		# header - specifies whether to show the Facebook header.
		# colorscheme - the color scheme for the plugin. Options: 'light', 'dark'
		# font - the font to display in the plugin. Options: 'arial', 'lucida grande', 'segoe ui', 'tahoma', 'trebuchet ms', 'verdana'
		# border_color - the border color of the plugin.
		# recommendations - specifies whether to always show recommendations in the plugin. If recommendations is set to true, the plugin will display recommendations in the bottom half.
		# filter - allows you to filter which URLs are shown in the plugin. The plugin will only include URLs which contain the filter string in the first two path parameters of the URL. If nothing in the first two path parameters of the URL matches the filter, the URL will not be included. For example, if the 'site' parameter is set to 'www.example.com' and the 'filter' parameter was set to '/section1/section2' then only pages which matched 'http://www.example.com/section1/section2/*' would be included in the activity feed section of this plugin. The filter parameter does not apply to any recommendations which may appear in this plugin (see above); Recommendations are based only on 'site' parameter.
		# linktarget - This specifies the context in which content links are opened. By default all links within the plugin will open a new window. If you want the content links to open in the same window, you can set this parameter to _top or _parent. Links to Facebook URLs will always open in a new window.
		# ref - a label for tracking referrals; must be less than 50 characters and can contain alphanumeric characters and some punctuation (currently +/=-.:_). Specifying a value for the ref attribute adds the 'fb_ref' parameter to the any links back to your site which are clicked from within the plugin. Using different values for the ref parameter for different positions and configurations of this plugin within your pages allows you to track which instances are performing the best.
		# max_age - a limit on recommendation and creation time of articles that are surfaced in the plugins, the default is 0 (we don’t take age into account). Otherwise the valid values are 1-180, which specifies the number of days.			

		def attributes
			super.merge(
				:site => :string, :action => :array, :app_id => :string, :width => :integer, :height => :integer,
				:header => :boolean, :colorscheme => colorschemes, :font => fonts,
				:border_color => :string, :recommendations => :boolean, :filter => :string, :linktarget => linktargets,
				:ref => :string, :max_age => :integer, :width => :integer
			)
		end
	end
end