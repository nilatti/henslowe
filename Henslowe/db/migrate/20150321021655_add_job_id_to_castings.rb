class AddJobIdToCastings < ActiveRecord::Migration
  def change
    add_column :castings, :job_id, :integer
  end
end
