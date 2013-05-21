class AddCityToTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :city, :string
  end
end
