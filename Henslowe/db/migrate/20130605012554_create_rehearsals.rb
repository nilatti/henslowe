class CreateRehearsals < ActiveRecord::Migration
  def self.up
    create_table :rehearsals do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :act
      t.references :scene
      t.references :french_scene
      t.references :space
      t.timestamps
    end
  end

  def self.down
    drop_table :rehearsals
  end
end
