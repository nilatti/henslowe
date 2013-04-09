class CreateCastings < ActiveRecord::Migration
  def change
    create_table :castings do |t|
      t.references :actor
      t.references :character
      t.references :production

      t.timestamps
    end
    add_index :castings, :actor_id
    add_index :castings, :character_id
    add_index :castings, :production_id
  end
end
