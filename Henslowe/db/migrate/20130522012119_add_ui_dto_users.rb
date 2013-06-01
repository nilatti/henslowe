class AddUiDtoUsers < ActiveRecord::Migration
  def up
    add_column :users, :uid, :string
  end

  def down
    drop_column :users, :uid
  end
end
