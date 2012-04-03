# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "facebook-social_plugins"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristian Mandrup"]
  s.date = "2012-04-03"
  s.description = "HTML5 compatible social plugin helpers for Rails 3"
  s.email = "kmandrup@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "AddToTimeline.txt",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "facebook-social_plugins.gemspec",
    "lib/facebook-social_plugins.rb",
    "lib/facebook-social_plugins/activity_feed.rb",
    "lib/facebook-social_plugins/add_to_timeline.rb",
    "lib/facebook-social_plugins/analytics.rb",
    "lib/facebook-social_plugins/button.rb",
    "lib/facebook-social_plugins/comments.rb",
    "lib/facebook-social_plugins/facepile.rb",
    "lib/facebook-social_plugins/like_box.rb",
    "lib/facebook-social_plugins/like_button.rb",
    "lib/facebook-social_plugins/live_stream.rb",
    "lib/facebook-social_plugins/login_button.rb",
    "lib/facebook-social_plugins/open_graph/meta_helper.rb",
    "lib/facebook-social_plugins/rails/engine.rb",
    "lib/facebook-social_plugins/recommendations_box.rb",
    "lib/facebook-social_plugins/registration.rb",
    "lib/facebook-social_plugins/script_helper.rb",
    "lib/facebook-social_plugins/send_button.rb",
    "lib/facebook-social_plugins/social_plugin.rb",
    "lib/facebook-social_plugins/subscribe_button.rb",
    "lib/facebook-social_plugins/ui_helper.rb",
    "lib/facebook-social_plugins/view_helper.rb",
    "spec/facebook-social_plugins/og_meta_helper_spec.rb",
    "spec/facebook-social_plugins/script_helper_spec.rb",
    "spec/facebook-social_plugins/view_helper_spec.rb",
    "spec/spec_helper.rb",
    "vendor/assets/html/facebook_channel.html",
    "vendor/assets/images/fb_logout_large.gif",
    "vendor/assets/images/fb_logout_small.gif"
  ]
  s.homepage = "http://github.com/kristianmandrup/facebook-social_plugins"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.20"
  s.summary = "Facebook HTML5 style social plugins for Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 3"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
      s.add_development_dependency(%q<rspec-rails>, [">= 2.5"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3"])
      s.add_dependency(%q<rspec>, [">= 2"])
      s.add_dependency(%q<rspec-rails>, [">= 2.5"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3"])
    s.add_dependency(%q<rspec>, [">= 2"])
    s.add_dependency(%q<rspec-rails>, [">= 2.5"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.1.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.3"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

