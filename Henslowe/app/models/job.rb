class Job < ActiveRecord::Base
  attr_accessible :user_id, :niche_id, :theater_id, :production_id
  
  belongs_to :user
  belongs_to :niche
  belongs_to :theater
  belongs_to :production
end