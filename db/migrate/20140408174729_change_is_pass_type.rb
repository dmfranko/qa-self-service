class ChangeIsPassType < ActiveRecord::Migration
  def change
    change_column :test_result_details,:is_pass,:int
  end
end
