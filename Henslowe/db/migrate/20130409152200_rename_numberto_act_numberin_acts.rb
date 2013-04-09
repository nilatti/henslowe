class RenameNumbertoActNumberinActs < ActiveRecord::Migration
  def up
    rename_column :acts, :number, :act_number
  end

  def down
    rename_column :acts, :act_number, :number
  end
end
