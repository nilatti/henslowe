class Theater < ActiveRecord::Base
  attr_accessible :mission_statement, :name, :state, :street_address, :website, :zip, :phone_number, :productions_attributes

  has_many :productions, :dependent => :destroy
  has_many :plays, :through => :productions
  has_many :actors, :through => :productions
end
