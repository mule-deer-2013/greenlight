
OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], :display => "popup"
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], 
  	{:scope => 'name, photo, email' :display => "popup", :client_options => { :ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end



# FACEBOOK_APP_ID: "204922036351905"
# FACEBOOK_SECRET: ed79eeea6d5f82a9bc5e4c8f84ef2579

# , :client_options => { :ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}