class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user
      t.references :job
      t.references :theater
      t.references :production

      t.timestamps
    end
    add_index :jobs, :user_id
    add_index :jobs, :job_id
    add_index :jobs, :theater_id
    add_index :jobs, :production_id
  end
end
