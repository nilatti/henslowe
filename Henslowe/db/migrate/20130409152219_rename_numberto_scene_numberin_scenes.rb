class RenameNumbertoSceneNumberinScenes < ActiveRecord::Migration
  def up
    rename_column :scenes, :number, :scene_number
  end

  def down
    rename_column :scenes, :scene_number, :number
  end
end
