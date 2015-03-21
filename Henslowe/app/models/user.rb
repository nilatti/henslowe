class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :hire_date, :image, :email, :calendar, :first_name, :last_name, :is_female, :uid, :refresh_token, :jobs_attributes, :niche_ids

  default_scope :order => 'is_female, first_name'

has_many :jobs, :dependent => :destroy
accepts_nested_attributes_for :jobs, :allow_destroy => true
scope :actor, -> { joins(:niches).where("niches.id = ? or niches.id = ?", 9, 10)} # 9 is actor niche, 10 is auditioner niche. change if niche id changes.
has_many :niches, :through => :jobs
has_many :theaters, :through => :jobs

has_many :castings
has_many :productions, :through => :jobs
has_many :theaters, :through => :productions

def is_actor
  User.actor.include?(self)
end


def self.create_with_omniauth(auth)
  create! do |user|
    user.uid = auth["uid"]
    #user.first_name = gplus['displayName']
    user.first_name = auth['info']['givenName']
    user.uid = auth['uid']
  end
end

def jobs_for_theater(theater)
  jobs = []
  self.jobs.each do |j|
    jobs << j
  end
  return jobs
end

def age
    birthdate = self.date_of_birth
	  now = Time.now
    age = now.year - birthdate.year - (birthdate.to_time.change(:year => now.year) > now ? 1 : 0)
  end	
  
  def name
    first_name + " " + last_name
  end
  
 
  def available_for_rehearsal?(rehearsal)
    conflicts = Array.new
    conflicts = Conflict.find(:all, :conditions => ['user_id = ?', self.id])
    conflicting = Array.new
    conflicts.each do |conflict|
      if rehearsal.start_time < conflict.end_time && conflict.end_time < rehearsal.end_time
        conflicting << conflict
      elsif rehearsal.start_time < conflict.start_time && conflict.start_time < rehearsal.end_time
        conflicting << conflict
      elsif conflict.start_time < rehearsal.start_time && rehearsal.end_time < conflict.end_time 
        conflicting << conflict
      end
    end
    if conflicting.size > 0
      false
    else
      true
    end
  end

  def castings_for_production(production)
    cas = Casting.find :all, :conditions => [ 'user_id = ? AND production_id = ?', self.id, production.id ]
  end
  
    def doubling_problems(production)
    fs = []
    problems = []
    castings = self.castings_for_production(production)
    characters = []
    castings.each do |cas|
      characters << cas.character
    end
    characters.each do |ons|
      ons.french_scenes.each do |french|
        unless fs.include?(french)
          fs << french
        else 
          problems << french
        end
      end
    end
    problems
  end


