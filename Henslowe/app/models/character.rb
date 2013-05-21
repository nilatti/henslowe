class Character < ActiveRecord::Base
  belongs_to :play
  has_many :castings, :dependent => :destroy
  has_many :actors, :through => :castings
  has_many :on_stages
  has_many :french_scenes, :through => :on_stages
  attr_accessible :age, :is_female, :name, :play_id
  default_scope :order => 'name ASC'
end
