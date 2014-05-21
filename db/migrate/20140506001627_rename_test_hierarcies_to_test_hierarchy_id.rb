class RenameTestHierarciesToTestHierarchyId < ActiveRecord::Migration
  def change
    rename_column :test_result_details,:test_hierarchies_id,:test_hierarchy_id
  end
end
