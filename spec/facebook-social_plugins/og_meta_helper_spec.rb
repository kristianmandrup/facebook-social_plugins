require 'spec_helper'

describe FacebookSocialPlugins::OpenGraph::MetaHelper do
  include ControllerTestHelpers,
          FacebookSocialPlugins::OpenGraph::MetaHelper

  describe 'OpenGraph Meta helper' do
    it "should write Open Graph meta tags " do
      output = fb_og_meta 'team_builder', 'team', '1234', 'recipe'
      output.should == "<head prefix=\"og: http://ogp.me/ns# og_team_builder: http://ogp.me/ns/apps/teamx#\"><meta content=\"1234\" property=\"fb:app_id\"></meta><meta content=\"team:recipe\" property=\"og:type\"></meta></head>"
    end
  end
end