class RemoveTestIdColumn < ActiveRecord::Migration
  def change
    remove_column :results,:test_id
    remove_column :runs,:test_id
  end
end
