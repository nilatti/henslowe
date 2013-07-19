class SessionsController < ApplicationController   
  def create     
    #What data comes back from OmniAuth?     
    @auth = request.env["omniauth.auth"]

    #Use the token from the data to request a list of calendars
    @token = @auth["credentials"]["token"]
    @refresh = @auth["credentials"]["refresh_token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    client.authorization.refresh_token = @refresh
    session[:token] = @token
    
    service = client.discovered_api('calendar', 'v3')
   
    @calendar = client.execute(
      :api_method => service.calendar_list.list,
      :parameters => {},
      :headers => {'Content-Type' => 'application/json'})
    cal = ""
    list = @calendar.data.items 
    list.each do |c|
      if c.accessRole == "owner"
        cal = c.id
      end
    end    
    plus = client.discovered_api('plus', 'v1')
    @gplus = client.execute!( plus.people.get,
      :userId => 'me').body
    profile = JSON.parse(@gplus)
        
    @user = User.find_by_uid(@auth["uid"]) 

    if @user
    else

      @user = User.new :uid => @auth['uid'], :first_name => profile['name']['givenName'], :last_name => profile['name']['familyName'], :image => profile['image']['url'], :email => @auth['info']['email'], :calendar => cal, :refresh_token => @refresh, :type => "Actor"
      @user.save
      
    end
        
  
    # set session user
    session[:user_id] = @user.id
    session[:refresh] = @user.refresh_token
    #render :text => request.env['omniauth.auth'].to_json
    redirect_to users_path, :notice => "Signed in as #{@user.first_name}"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to users_path, :notice => "Signed out"
  end
end
