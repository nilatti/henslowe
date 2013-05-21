class Theater < ActiveRecord::Base
  attr_accessible :mission_statement, :name, :state, :street_address, :city, :website, :zip, :phone_number, :productions_attributes

  has_many :productions, :dependent => :destroy
  has_many :plays, :through => :productions
  has_many :users, :through => :productions
  has_many :spaces, :dependent => :destroy
end
