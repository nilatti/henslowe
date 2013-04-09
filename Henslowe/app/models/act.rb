class Act < ActiveRecord::Base
  attr_accessible :act_number, :scenes_attributes, :french_scenes_attributes, :play_id
  belongs_to :play
  has_many :scenes, :dependent => :destroy
  accepts_nested_attributes_for :scenes, :allow_destroy => true
  has_many :french_scenes, :through => :scenes
  has_many :characters
  default_scope :order => 'act_number'

  def on_stage
    characters = Array.new
    s = self.scenes
    s.each do |s|
      s.french_scenes.each do |f|
        f.characters.each do |c|
          unless characters.include?(c)
            characters << c
          end
        end
      end
    end
    characters
  end
end
