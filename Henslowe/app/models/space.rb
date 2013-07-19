class Space < ActiveRecord::Base
  belongs_to :theater
  attr_accessible :address, :name, :seating_capacity, :theater_id, :calendar
end
