class RehearsalsController < ApplicationController
  before_filter :load_production  

  def index
    @rehearsals = @production.rehearsals.all
  end
  
  def show
    @rehearsal = @production.rehearsals.find(params[:id])
    cal = @rehearsal.production.theater.calendar
    event = @rehearsal.event_id

    client = Google::APIClient.new
    client.authorization.access_token = session[:token]
    service = client.discovered_api('calendar', 'v3')
    result = client.execute(
      :api_method => service.events.get, 
      :parameters => {'calendarId' => cal, 'eventId' => event })
      
    @data = result.data
    @actors = @data['attendees']
    
  end
  
  def new
    @rehearsal = @production.rehearsals.new
    
  end
  
  def create
    @rehearsal = @production.rehearsals.new(params[:rehearsal])
      client = Google::APIClient.new
      client.authorization.access_token = session[:token]
      service = client.discovered_api('calendar', 'v3')
      cal = @rehearsal.production.theater.calendar
      actors = @rehearsal.actors_called
      actors.collect! do |a|
        { :email => a.email }
      end
      
      req = { 
        'start' => {
          'dateTime' => @rehearsal.start_time}, 
        'end' => { 
          'dateTime' => @rehearsal.end_time},
        'location' => @rehearsal.space.name,
        'summary' => "Rehearsal for #{@rehearsal.production.play.title}",
        'description' => "Rehearse #{@rehearsal.rehearsal_item}",
        'attendees' => actors
            }
    
      result = client.execute(
      :api_method => service.events.insert, 
      :parameters => {'calendarId' => cal },
      :body => JSON.dump(req), #call search query string here. Why? Search me!
      :headers => {'Content-Type' => 'application/json'}
   )
   data = result.data.to_json
   
   @parsed = ActiveSupport::JSON.decode(data)
   @rehearsal.event_id = @parsed['id']
    if @rehearsal.save
      
      flash[:notice] = "Successfully created rehearsal."
      redirect_to [@production, @rehearsal]
      
    else
      render :action => 'new'
    end
  end
  
  def edit
    @rehearsal = @production.rehearsals.find(params[:id])
  end
  
  def update
    @rehearsal = @production.rehearsals.find(params[:id])
    
      client = Google::APIClient.new
      client.authorization.access_token = session[:token]
      service = client.discovered_api('calendar', 'v3')
      cal = @rehearsal.production.theater.calendar
      event = @rehearsal.event_id
      actors = @rehearsal.actors_called(@rehearsal.production)
      actors.collect! do |a|
        { :email => a.email }
      end
      
      
      result = client.execute(
      :api_method => service.events.get, 
      :parameters => {'calendarId' => cal, 'eventId' => event })
      
      event = result.data
      
      event = { 
        'start' => {
          'dateTime' => @rehearsal.start_time}, 
        'end' => { 
          'dateTime' => @rehearsal.end_time},
        'location' => @rehearsal.space.name,
        'summary' => "Rehearsal for #{@rehearsal.production.play.title}",
        'description' => "Rehearse #{@rehearsal.rehearsal_item}",
        'sendNotifications' => true,
        'attendees' => actors
            }
      result = client.execute(:api_method => service.events.update, 
        :parameters => {'calendarId' => cal, 'eventId' => event},
           :body_object => event,
           :headers => {'Content-Type' => 'application/json'}
   )
   data = result.data.to_json
   
   @parsed = ActiveSupport::JSON.decode(data)
    
    
    if @rehearsal.update_attributes(params[:rehearsal])
      flash[:notice] = "Successfully updated rehearsal."
      redirect_to [@production, @rehearsal]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @rehearsal = production.rehearsals.find(params[:id])
    @rehearsal.destroy
    flash[:notice] = "Successfully destroyed rehearsal."
    redirect_to production_rehearsals_path(@production)
  end

private

    def load_production
      @production = Production.find(params[:production_id])
    end
end
