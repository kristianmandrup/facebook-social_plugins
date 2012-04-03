require 'spec_helper'

describe FacebookSocialPlugins::Helper::OpenGraph do
  include ControllerTestHelpers,
          FacebookSocialPlugins::Helper::OpenGraph

  describe 'OpenGraph Meta helper' do
    it "should write Open Graph meta tags " do
      output = open_graph_meta 'team_builder', 'team', '1234', 'recipe'
      output.should == "<head prefix=\"og: http://ogp.me/ns# og_team_builder: http://ogp.me/ns/apps/teamx#\"><meta content=\"1234\" property=\"fb:app_id\"></meta><meta content=\"team:recipe\" property=\"og:type\"></meta></head>"
    end

    it "should write Open Graph meta tags with title, image and url" do
      output = open_graph_meta 'team_builder', 'team', '1234', 'recipe', :title => 'my recipe', :img => 'recipe.png', :url => 'http://hello.html', :desc => 'My recipe is good'
      output.should == "<head prefix=\"og: http://ogp.me/ns# og_team_builder: http://ogp.me/ns/apps/teamx#\"><meta content=\"1234\" property=\"fb:app_id\"></meta><meta content=\"team:recipe\" property=\"og:type\"></meta><meta content=\"my recipe\" property=\"og:title\"></meta><meta content=\"recipe.png\" property=\"og:image\"></meta><meta content=\"My recipe is good\" property=\"og:image\"></meta><meta content=\"http://hello.html\" property=\"og:image\"></meta></head>"
    end
  end
end