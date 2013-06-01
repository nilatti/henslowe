class SessionsController < ApplicationController   
  def create     
    #What data comes back from OmniAuth?     
    @auth = request.env["omniauth.auth"]

    #Use the token from the data to request a list of calendars
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
   
    @calendar = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
 
    plus = client.discovered_api('plus', 'v1')
    @gplus = client.execute!( plus.people.get,
      :userId => 'me').body
    profile = JSON.parse(@gplus)
        
    @user = User.find_by_uid(@auth["uid"]) 
    if @user
    else

      @user = User.new :uid => @auth['uid'], :first_name => profile['name']['givenName'], :last_name => profile['name']['familyName'], :image => profile['image']['url']
      @user.save

    end
        
    # set session user
    session[:user_id] = @user.id
    #render :text => request.env['omniauth.auth'].to_yaml
   # redirect_to users_path, :notice => "Signed in as #{@user.first_name}"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to users_path, :notice => "Signed out"
  end
end
