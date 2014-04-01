class HierarchyDescriptionChange < ActiveRecord::Migration
  def change
    rename_column :test_hierarchies,:test_hierarchy_decription,:test_hierarchy_description
  end
end