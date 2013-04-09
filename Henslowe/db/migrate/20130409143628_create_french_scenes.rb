class CreateFrenchScenes < ActiveRecord::Migration
  def change
    create_table :french_scenes do |t|
      t.string :number
      t.references :play
      t.references :act
      t.references :scene

      t.timestamps
    end
    add_index :french_scenes, :play_id
    add_index :french_scenes, :act_id
    add_index :french_scenes, :scene_id
  end
end
