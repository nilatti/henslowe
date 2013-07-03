class Rehearsal < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :act_id, :scene_id, :french_scene_id, :space_id, :production_id

  belongs_to :production
  belongs_to :act
  belongs_to :scene
  belongs_to :french_scene
  belongs_to :space

  def who_can_make_it?(session)
    ids = [] 
    self.production.actors.each do |a|
      ids << a #get all actors who are cast in the production into an array
    end
    ids.collect! do |a|
      { :id => a.calendar } #pretend that the calendar id is the user id? This had to be done in a particular way because JSON or something
    end
    query = {'timeMin'=> self.start_time, 'timeMax' => self.end_time, 'items' =>  ids} #build search query string here.
    
    client = Google::APIClient.new
    client.authorization.access_token = session[:token]
    service = client.discovered_api('calendar', 'v3')
    result = client.execute({
      :api_method => service.freebusy.query,
      body: query.to_json, #call search query string here. Why? Search me!
    headers: {'Content-Type' => 'application/json'}
   })
   data = result.data.to_json
   
   parsed = ActiveSupport::JSON.decode(data)
   available = []
   n = 0
   parsed["calendars"].each do |k,v|
     v.each do |a,b|
       if b.empty?
         available << self.production.actors[n]
       end
     end
   n += 1
   end
  return available
  end

  def french_scenes_possible(session)
    fsp = []
    self.production.play.french_scenes.each do |fs|
      if self.who_can_make_it?(session) & fs.actors_called(self.production) == fs.actors_called(self.production)
        fsp << fs
      end
    end
    return fsp
  end
end
