class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :address
      t.integer :seating_capacity
      t.references :theater

      t.timestamps
    end
    add_index :spaces, :theater_id
  end
end
