class IsPassType < ActiveRecord::Migration
  def change
    change_column :test_result_details,:isPass,:integer
  end
end
