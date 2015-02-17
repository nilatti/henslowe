class Casting < ActiveRecord::Base
  attr_accessible :character_id, :user_id, :production_id
  
  belongs_to :user
  belongs_to :character
  belongs_to :production
  
end
