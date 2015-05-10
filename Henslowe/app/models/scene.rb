class Scene < ActiveRecord::Base
  before_create :set_defaults 

  belongs_to :play
  belongs_to :act
  attr_accessible :scene_number, :french_scenes_attributes, :play_id, :act_id

  has_many :french_scenes, :dependent => :destroy
  accepts_nested_attributes_for :french_scenes, :allow_destroy => :true
  has_many :characters, :through => :french_scenes
  default_scope :order => 'scene_number'

  def full_path
    path = self.act.act_number.to_s + "." + self.scene_number.to_s
    path.to_s
    return path
  end
  
  def pretty_name
    name = "Scene " + self.full_path
  end

  def set_defaults
    act = self.act
    self.play_id = act.play_id
  end

  def actors_called(production)
    actors = []
    for fs in self.french_scenes do 
      fs.actors_called(production).each do |a|
        unless actors.include?(a)
          actors << a
          actors.sort! {|a, b| a.first_name <=> b.first_name }
        end
      end
    end
    return actors
  end
end
