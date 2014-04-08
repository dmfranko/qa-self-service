class TestplatformColumnRename < ActiveRecord::Migration
  def change
    rename_column :test_platforms,:test_runs_id,:test_run_id
  end
end
