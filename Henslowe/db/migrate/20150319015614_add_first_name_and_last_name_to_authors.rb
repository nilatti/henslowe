class AddFirstNameAndLastNameToAuthors < ActiveRecord::Migration
  def change
    rename_column :authors, :name, :first_name
    add_column :authors, :last_name, :string
  end
end
