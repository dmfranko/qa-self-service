class RenamePlatformsIdInTestPlatform < ActiveRecord::Migration
  def change
    rename_column :test_platforms,:platforms_id,:platform_id
  end
end
