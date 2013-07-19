class AddCalendartoTheaters < ActiveRecord::Migration
  def change
    add_column :theaters, :calendar, :string
  end
end
