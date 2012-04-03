require 'spec_helper'


async_script = %Q{
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '123', // App ID
      channelUrl : '//www.example.com/assets/facebook_channel.html', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
  };
}

fb_script = %Q{
(function(d){
   var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   d.getElementsByTagName('head')[0].appendChild(js);
 }(document));
}

fb_script_es = %Q{
(function(d){
   var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/es_LA/all.js";
   d.getElementsByTagName('head')[0].appendChild(js);
 }(document));
}


describe FacebookSocialPlugins::ScriptHelper do
  include ControllerTestHelpers,
          FacebookSocialPlugins::ScriptHelper

  describe '#async_init_script' do
    it "should create async init script" do
      output = fb_async_init_script '123', 'www.example.com'
      output.should == async_script
    end
  end

  describe '#facebook_script' do
    it "should create facebook script" do
      output = fb_channel_script
      output.should == fb_script
    end

    it "should create localized facebook script" do
      output = fb_channel_script :es_LA
      output.should == fb_script_es
    end
  end

  describe '#fb_login_and_react' do
    it 'should work' do
      output = fb_login_and_react :ready => true, :selector => '#fb_login', :scope => 'email,user_likes'
      output.should == "$(function() {\n\t\t$('#fb_login').click(function() { \n\t\tFB.login(function(response) { \n\t\t\tif (response.authResponse) {\n\t\t\t\t// on success\n\t\t\t} else {\n\t\t\t\t// on failure\n\t\t\t}\t\t\t\n\t\t}); \n\t\treturn false;\n  }, {scope: 'email,user_likes'}\n\n\t}\n" 
    end
  end

  describe '#fb_logout_and_react' do
    it 'should work' do
      output = fb_logout_and_react :ready => true, :failure => "console.log('failed FB logout');"
      output.should == "$(function() {\n\t\t$('#fb_logout').click(function() { \n\t\tFB.login(function(response) { \n\t\t\tif (response.authResponse) {\n\t\t\t\t// on success\n\t\t\t} else {\n\t\t\t\tconsole.log('failed FB logout');\n\t\t\t}\t\t\t\n\t\t}); \n\t\treturn false;\n \t}\n\n\t}\n"
    end
  end

  describe '#fb_logout_and_redirect_to' do
    it 'should work' do
      output = fb_logout_and_redirect_to('facebook/logout', :ready => true)
      output.should == "$(function() {\n\t\tFB.Event.subscribe(\"auth.logout\", function() { \n\twindow.location = 'facebook/logout' \n\t}); \n\n\t}\n"
    end
  end
end