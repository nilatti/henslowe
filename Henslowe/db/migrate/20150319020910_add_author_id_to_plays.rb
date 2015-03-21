class AddAuthorIdToPlays < ActiveRecord::Migration
  def change
  	add_column :plays, :author_id, :integer
  end
end
