class TestResultColumn < ActiveRecord::Migration
  def change
    add_column :test_result_details,:example_result,:string
  end
end
