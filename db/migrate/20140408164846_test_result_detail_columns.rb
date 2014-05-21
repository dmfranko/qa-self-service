class TestResultDetailColumns < ActiveRecord::Migration
  def change
    rename_column :test_result_details,:example_result,:isPass
    change_column :test_result_details,:isPass,:boolean
  end
end
