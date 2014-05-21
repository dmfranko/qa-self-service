class DropTestResultDetails < ActiveRecord::Migration
  def change
    drop_table :test_result_details
  end
end
