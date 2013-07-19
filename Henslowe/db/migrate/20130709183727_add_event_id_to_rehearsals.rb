class AddEventIdToRehearsals < ActiveRecord::Migration
  def change
    add_column :rehearsals, :event_id, :string
  end
end
