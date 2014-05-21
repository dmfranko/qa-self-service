class TestHierarchyColumnRename < ActiveRecord::Migration
  def change
    rename_column :test_hierarchies,:test_run_platforms_id,:test_platforms_id
  end
end
