class DropTyepFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :type
  end
end
