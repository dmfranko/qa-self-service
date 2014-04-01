class CreateTestResultDetails < ActiveRecord::Migration
  def change
    create_table :test_result_details do |t|
      t.belongs_to :test_hierarchies
      t.float :test_execution_duration
      t.timestamps
    end
  end
end
