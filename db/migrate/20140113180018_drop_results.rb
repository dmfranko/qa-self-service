class DropResults < ActiveRecord::Migration
  def change
    drop_table :results
  end
end
