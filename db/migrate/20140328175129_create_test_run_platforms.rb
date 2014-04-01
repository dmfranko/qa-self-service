class CreateTestRunPlatforms < ActiveRecord::Migration
  def change
    create_table :test_run_platforms do |t|
      t.belongs_to :test_runs
      t.belongs_to :test_platforms
      t.timestamp :test_run_platform_start_time
      t.timestamp :test_run_platform_end_time
      t.timestamps
    end
  end
end
