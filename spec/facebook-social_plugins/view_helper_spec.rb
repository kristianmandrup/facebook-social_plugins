require 'spec_helper'

describe FacebookSocialPlugins::Helper::View do
  include ControllerTestHelpers,
          FacebookSocialPlugins::Helper::View

  describe 'Social plugin' do
    it "should not create plugin if unknown attribute is encountered" do
      lambda { fb_activity_feed :my_site => 'www.example.com' }.should raise_error
    end
  end

  describe 'Analytics meta tag' do
    it "should create :meta" do
      output = fb_analytics 12345
      output.should == "<meta content=\"12345\" property=\"fb:admins\"></meta>"
    end
  end

  describe 'Logout button' do
    it "should create :logout button (anchor with image" do
      output = fb_logout_button :size => :large
      output.should == "<a href=\"#\" id=\"fb_logout_and_reload\"><img alt=\"Facebook Logout\" id=\"fb_logout_image\" src=\"/assets/fb_logout_large.gif\"></img></a>"
    end
  end

  describe 'Facebook Root placeholder' do
    it "should create :root div" do
      output = fb_root
      output.should == "<div class=\"fb-root\"></div>"
    end
  end

  describe 'Activity Feed' do
    it "should create :activity div" do
      output = fb_activity_feed :site => 'www.example.com'
      output.should == "<div class=\"fb-activity\" data-site=\"www.example.com\"></div>"
    end
  end

  describe 'Add To Timeline' do
    it "should create :add-to-timeline div" do
      output = fb_add_to_timeline :mode => 'box'
      output.should == "<div class=\"fb-add-to-timeline\" data-mode=\"box\"></div>"
    end
  end

  describe 'Comments' do
    it "should create :comments div" do
      output = fb_comments :href => 'http://www.example.com'
      output.should == "<div class=\"fb-comments\" data-href=\"http://www.example.com\"></div>"
    end
  end

  describe 'Facepile' do
    it "should create :facepile div" do
      output = fb_facepile :event_app_id => '276334346'
      output.should == "<div class=\"fb-facepile\" data-event-app-id=\"276334346\"></div>"
    end
  end

  describe 'Like Box' do
    it "should create :like-box div" do
      output = fb_like_box :href => 'http://www.example.com'
      output.should == "<div class=\"fb-like-box\" data-href=\"http://www.example.com\"></div>" 
    end
  end

  describe 'Like Button' do
    it "should create :like-button div" do
      output = fb_like_button :href => 'http://www.example.com'
      output.should == "<div class=\"fb-like\" data-href=\"http://www.example.com\"></div>" 
    end
  end

  describe 'Live Stream' do
    it "should create :live-stream div" do
      output = fb_live_stream :'via-url' => 'http://www.example.com'
      output.should == "<div class=\"fb-live-stream\" data-via-url=\"http://www.example.com\"></div>" 
    end

    it "should create :live-stream div even if non-dashed attribute" do
      output = fb_live_stream :via_url => 'http://www.example.com'
      output.should == "<div class=\"fb-live-stream\" data-via-url=\"http://www.example.com\"></div>" 
    end
  end

  describe 'Login Button' do
    it "should create :login-button div" do
      output = fb_login_button :show_faces => true
      output.should == "<div class=\"fb-login-button\" data-show-faces=\"true\"></div>"
    end
  end  

  describe 'Recommendations Box' do
    it "should NOT create :recommendations div when invalid kind of linktarget" do
      lambda { fb_recommendations_box :linktarget => '_other' }.should raise_error      
    end

    it "should create :recommendations div when valid kind of linktarget" do
      output = fb_recommendations_box :linktarget => '_parent'
      output.should == "<div class=\"fb-recommendations\" data-linktarget=\"_parent\"></div>"
    end
  end

  describe 'Registration' do
    it "should create :registration div" do
      output = fb_registration :target => '_self'
      output.should == "<div class=\"fb-registration\" data-target=\"_self\"></div>"
    end
  end    

  describe 'Send Button' do
    it "should NOT create :send-button div if invalid font" do
      lambda { fb_send_button :colorscheme => 'light', :font => 'unknown' }.should raise_error      
    end

    it "should NOT create :send-button div if invalid colorscheme" do
      lambda { fb_send_button :colorscheme => 'brown', :font => 'arial' }.should raise_error      
    end

    it "should create :send-button div" do
      output = fb_send_button :colorscheme => 'light', :font => 'arial'
      output.should == "<div class=\"fb-send\" data-colorscheme=\"light\" data-font=\"arial\"></div>" 
    end
  end    

  describe 'Subscribe Button' do
    it "should create :subscribe-button div" do
      output = fb_subscribe_button :width => 200
      output.should == "<div class=\"fb-subscribe\" data-width=\"200\"></div>" 
    end
  end    
end