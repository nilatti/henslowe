#app/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], {
   # scope: 'email https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/plus.login', approval_prompt: 'force', response_type: 'code', access_type: 'offline'
    scope: ['email',
    'https://www.googleapis.com/auth/gmail.modify'],
    access_type: 'offline'}

end


