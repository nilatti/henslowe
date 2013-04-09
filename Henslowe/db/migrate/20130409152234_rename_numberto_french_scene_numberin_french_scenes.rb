class RenameNumbertoFrenchSceneNumberinFrenchScenes < ActiveRecord::Migration
  def up
    rename_column :french_scenes, :number, :french_scene_number
  end

  def down
    rename_column :french_scenes, :french_scene_number, :number
  end
end
