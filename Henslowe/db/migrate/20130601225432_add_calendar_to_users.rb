class AddCalendarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :calendar, :string
  end
end
