class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.boolean :is_female
      t.integer :age
      t.references :play

      t.timestamps
    end
    add_index :characters, :play_id
  end
end
