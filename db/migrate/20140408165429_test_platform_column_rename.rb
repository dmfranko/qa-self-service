class TestPlatformColumnRename < ActiveRecord::Migration
  def change
    rename_column :test_platforms,:test_run_id,:test_id
  end
end
