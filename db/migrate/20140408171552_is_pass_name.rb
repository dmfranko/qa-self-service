class IsPassName < ActiveRecord::Migration
  def change
    rename_column :test_result_details,:isPass,:is_pass
    change_column :test_result_details,:is_pass,:integer
  end
end
