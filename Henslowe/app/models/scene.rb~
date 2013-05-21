class Scene < ActiveRecord::Base
  belongs_to :play
  belongs_to :act
  attr_accessible :scene_number, :french_scenes_attributes, :play_id, :act_id

  has_many :french_scenes, :dependent => :destroy
  accepts_nested_attributes_for :french_scenes, :allow_destroy => :true
  has_many :characters
  default_scope :order => 'scene_number'

  def on_stage
    characters = Array.new
    fs = self.french_scenes
    fs.each do |f|
      f.characters.each do |c|
        unless characters.include?(c)
          characters << c
       end
      end
    end
    characters
  end

end
