class RecreateTestResultDetails < ActiveRecord::Migration
  def change
    create_table :test_result_details do |t|
      t.belongs_to :test_hierarchy
      t.integer :is_pass
      t.float :test_execution_duration
      t.timestamps
    end
  end
end
