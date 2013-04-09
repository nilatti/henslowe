class AddBestRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :best_role, :string
  end
end
