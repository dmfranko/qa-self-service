class DropUnusedTables < ActiveRecord::Migration
  def change
    drop_table :runs
    drop_table :results
  end
end
