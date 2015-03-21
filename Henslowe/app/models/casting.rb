class Casting < ActiveRecord::Base
  attr_accessible :character_id, :user_id, :production_id
  accepts_nested_attributes_for :job
  
  belongs_to :user
  belongs_to :character
  belongs_to :production
  belongs_to :job

end
