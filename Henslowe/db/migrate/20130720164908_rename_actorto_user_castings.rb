class RenameActortoUserCastings < ActiveRecord::Migration
  def change
  	rename_column :castings, :actor_id, :user_id
  end
end
