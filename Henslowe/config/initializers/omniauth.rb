#app/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "371402534497.apps.googleusercontent.com", "zKJ7oi4iDZMNHqdevNKziUX7", {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar https://www.googleapis.com/auth/plus.login', :approval_prompt => "auto",
    redirect_uri:'http://localhost/auth/google_oauth2/callback'
  }

end


