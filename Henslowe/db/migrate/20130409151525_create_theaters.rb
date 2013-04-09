class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.string :name
      t.string :street_address
      t.string :state
      t.string :zip
      t.text :mission_statement
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
