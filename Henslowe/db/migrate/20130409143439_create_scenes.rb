class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.integer :number
      t.references :play
      t.references :act

      t.timestamps
    end
    add_index :scenes, :play_id
    add_index :scenes, :act_id
  end
end
