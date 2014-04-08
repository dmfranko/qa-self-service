class TestRunPlatformRename < ActiveRecord::Migration
  def change
    rename_table(:test_run_platforms,:test_platforms)
  end
end
