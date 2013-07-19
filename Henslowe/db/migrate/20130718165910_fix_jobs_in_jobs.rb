class FixJobsInJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :job_id, :niche_id
  end

end
