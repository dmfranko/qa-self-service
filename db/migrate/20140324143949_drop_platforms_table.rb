class DropPlatformsTable < ActiveRecord::Migration
  def change
    drop_table :available_test_platforms
  end
end
