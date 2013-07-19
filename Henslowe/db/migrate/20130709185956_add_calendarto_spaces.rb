class AddCalendartoSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :calendar, :string
  end
end
