class Rehearsal < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :act_id, :scene_id, :french_scene_id, :space_id, :production_id, :event_id

  belongs_to :production
  belongs_to :act
  belongs_to :scene
  belongs_to :french_scene
  belongs_to :space
  
  def rehearsal_item
    if self.act
      rehearse = self.act
    elsif self.scene
      rehearse = self.scene
    elsif self.french_scene
      rehearse = self.french_scene
    end
    return rehearse
  end
  
  def actors_called(production)
    actors = []
    if rehearsal_item.class.name == "FrenchScene"
      rehearsal_item.actors_called(production).each do |a|
        actors << a
      end
    else
      rehearsal_item.french_scenes.each do |fs|
        fs.actors_called(production).each do |a|
          unless actors.include?(a)
            actors << a
          end
        end
      end
    end
    return actors
  end
  
  def who_can_make_it?(session) #can I do this once and cache it? is there a debug flag I could set?
    ids = [] 
    self.production.actors.each do |a|
      ids << a #get all actors who are cast in the production into an array
    end
    ids.collect! do |a|
      { :id => a.calendar } #pretend that the calendar id is the user id? This had to be done in a particular way because JSON or something
    end
    query = {'timeMin'=> self.start_time, 'timeMax' => self.end_time, 'items' =>  ids} #build search query string here.
    
    client = Google::APIClient.new
    client.authorization.access_token = session[:token] #can I take these steps out?
    service = client.discovered_api('calendar', 'v3') #can I take these steps out? what if I get this document and save in an initializer?
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
  
  def scenes_possible(session)
    scenes = []
    actors = []
    self.production.play.scenes.each do |s|
      fsp = []
      s.french_scenes.each do |fs|
        if self.french_scenes_possible(session).include?(fs)
          fsp << fs
        end
        if fsp.size == s.french_scenes.size
          scenes << s
        end
      end
    end
    return scenes
    #return actors
  end
  
  def acts_possible(session)
    acts = []
    self.production.play.acts.each do |a|
    sp = []
      a.scenes.each do |s|
        if self.scenes_possible(session).include?(s)
          sp << s
        end
        if sp.size == a.scenes.size
          acts << a
        end
      end
    end
    return acts
  end
  
end
