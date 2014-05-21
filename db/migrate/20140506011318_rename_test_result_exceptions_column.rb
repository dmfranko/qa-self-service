class RenameTestResultExceptionsColumn < ActiveRecord::Migration
  def change
    rename_column :test_result_exceptions,:test_result_details_id,:test_result_detail_id
  end
end
