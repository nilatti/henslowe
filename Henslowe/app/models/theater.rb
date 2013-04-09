class Theater < ActiveRecord::Base
  attr_accessible :, :mission_statement, :name, :state, :street_address, :website, :zip

  has_many :productions
  has_many :plays, :through => :productions
  has_many :actors, :through => :productions
end
