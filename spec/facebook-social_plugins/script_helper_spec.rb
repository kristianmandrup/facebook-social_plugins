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


describe FacebookSocialPlugins::Helper::Script do
  include ControllerTestHelpers,
          FacebookSocialPlugins::Helper::Script

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
    it 'should display basic login script with scoped permissions' do
      output = fb_login_click_react :ready => true, :selector => '#fb_login', :scope => 'email,user_likes'
      output.should == "$(function() {\n\t\t$('#fb_login').click(function() { \n\t\t$(function() {\n\t\tFB.login(function(response) { \n\t\tif (response.authResponse) {\n\t\t\t// on success\n\t\t} else {\n\t\t\t// on failure\n\t\t}\t\t\t\n\t}, {scope: 'email,user_likes'}); \n\n\t}\n\n\t\treturn false;\n  }\n\n\t}\n"
    end

    it 'should display basic login script with console.log for success and failure' do
      output = fb_login_click_react :ready => true, :on_success => "console.log('logged in to facebook');", :on_fail => "console.log('facebook login failure');"
      output.should == "$(function() {\n\t\t$('#fb_login').click(function() { \n\t\t$(function() {\n\t\tFB.login(function(response) { \n\t\tif (response.authResponse) {\n\t\t\tconsole.log('logged in to facebook');\n\t\t} else {\n\t\t\tconsole.log('facebook login failure');\n\t\t}\t\t\t\n\t}); \n\n\t}\n\n\t\treturn false;\n  }\n\n\t}\n"
    end
  end

  describe '#fb_logout_and_react' do
    it 'should render fb logout script with no reaction' do
      output = fb_logout_click_react :ready => true
      output.should == "$(function() {\n\t\t$('#fb_logout').click(function() { \n\t\tFB.logout(function(response) { \n\t\t// on done\n\t});\n\n\t\treturn false;\n \t}\n\n\t}\n"
    end

    it 'should render fb logout script with console.log after done' do
      output = fb_logout_click_react :ready => true, :on_done => "console.log('logged out from facebook');"
      output.should == "$(function() {\n\t\t$('#fb_logout').click(function() { \n\t\tFB.logout(function(response) { \n\t\tconsole.log('logged out from facebook');\n\t});\n\n\t\treturn false;\n \t}\n\n\t}\n"
    end
  end

  describe '#fb_onlogout_redirect_to' do
    it 'should work' do
      output = fb_onlogout_redirect_to('facebook/logout', :ready => true)
      output.should == "$(function() {\n\t\tFB.Event.subscribe(\"auth.logout\", function() { \n\twindow.location = 'facebook/logout' \n\t}); \n\n\t}\n"
    end
  end
end