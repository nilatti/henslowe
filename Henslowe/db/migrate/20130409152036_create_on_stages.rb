class CreateOnStages < ActiveRecord::Migration
  def change
    create_table :on_stages do |t|
      t.references :character
      t.references :french_scene

      t.timestamps
    end
    add_index :on_stages, :character_id
    add_index :on_stages, :french_scene_id
  end
end
