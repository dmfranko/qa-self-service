class AddRedisKeyToTestPlatforms < ActiveRecord::Migration
  def change
    add_column :test_platforms,:resque_key,:string
  end
end
