class AddProductionToRehearsals < ActiveRecord::Migration
  def change
    add_column :rehearsals, :production_id, :integer
  end
end
