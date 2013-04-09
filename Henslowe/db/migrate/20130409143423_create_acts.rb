class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.integer :number
      t.references :play

      t.timestamps
    end
    add_index :acts, :play_id
  end
end
