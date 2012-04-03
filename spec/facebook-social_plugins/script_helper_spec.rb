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

  it "should create async init script" do
    output = async_init_script '123', 'www.example.com'
    output.should == async_script
  end

  it "should create facebook script" do
    output = facebook_script
    output.should == fb_script
  end

  it "should create localized facebook script" do
    output = facebook_script :es_LA
    output.should == fb_script_es
  end
end