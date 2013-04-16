class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :hire_date, :job, :first_name, :last_name, :type

  default_scope :order => 'first_name ASC'

  has_many :castings
  has_many :characters, :through => :castings
  has_many :productions, :through => :castings

def age
    birthdate = self.birthdate
	now = Time.now
    age = now.year - birthdate.year - (birthdate.to_time.change(:year => now.year) > now ? 1 : 0)
  end	
  
  def name
    first_name + " " + last_name
  end
  
  def chars_for_production(production)
    cas = Casting.find :all, :conditions => [ 'actor_id = ? AND production_id = ?', self.id, production.id ]
  end

  def doubling_problems(production)
    fs = []
    problems = []
    castings = self.chars_for_production(production)
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
end
end

