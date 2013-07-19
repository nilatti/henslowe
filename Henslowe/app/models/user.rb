class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :hire_date, :image, :email, :calendar, :first_name, :last_name, :is_female, :uid, :refresh_token, :jobs_attributes, :niche_ids

  default_scope :order => 'is_female, first_name'

has_many :jobs
accepts_nested_attributes_for :jobs

has_many :niches, :through => :jobs

def self.create_with_omniauth(auth)
  create! do |user|
    user.uid = auth["uid"]
    #user.first_name = gplus['displayName']
    user.first_name = auth['info']['givenName']
    user.uid = auth['uid']
  end
end
def age
    birthdate = self.birthdate
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
end


