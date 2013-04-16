class Play < ActiveRecord::Base
  has_many :productions
  has_many :theaters, :through => :productions
  has_many :acts, :dependent => :destroy
  accepts_nested_attributes_for :acts, :allow_destroy => true
  has_many :scenes, :through => :acts
  has_many :french_scenes, :through => :scenes
  has_many :characters
  accepts_nested_attributes_for :characters, :allow_destroy => true

attr_accessible :title, :date, :number_of_acts, :acts_attributes, :characters_attributes, :scenes_attributes
  attr_accessor :number_of_acts
end

