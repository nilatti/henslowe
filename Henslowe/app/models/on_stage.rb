class OnStage < ActiveRecord::Base
  attr_accessible :french_scene_id, :character_id

  belongs_to :character
  belongs_to :french_scene
end
