class CreateTestHierarchies < ActiveRecord::Migration
  def change
    create_table :test_hierarchies do |t|
      t.belongs_to :test_run_platforms
      t.string :ancestry
      t.string :test_hierarchy_decription
      t.timestamps
    end
  end
end
