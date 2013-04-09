class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.date :start_date
      t.date :end_date
      t.references :play
      t.references :theater

      t.timestamps
    end
    add_index :productions, :play_id
    add_index :productions, :theater_id
  end
end
