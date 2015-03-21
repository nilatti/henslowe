class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth_date
      t.date :death_date
      t.text :bio

      t.timestamps
    end
  end
end
