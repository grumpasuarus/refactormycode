# disable the ssl. more details in https://github.com/intridea/omniauth/issues/260
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '48c6aade1f31410073a2', '082d0e487cb89b7b521eace61eb18c3d08370ed3'#, {:client_options => {:ssl => {:ca_path => "/opt/local/share/curl/curl-ca-bundle.crt"}}}
  
  # ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!
  
  # you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
  require 'openid/store/filesystem'
  
  # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  
  # generic openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'
  
  # dedicated openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  # provider :google_apps, OpenID::Store::Filesystem.new('./tmp'), :name => 'google_apps'
  # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com
  
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'myopenid', :identifier => 'myopenid.com'
  
  # Sign-up urls for Facebook, Twitter, and Github
  # https://developers.facebook.com/setup
  # https://github.com/account/applications/new
  # https://developer.twitter.com/apps/new
  
end