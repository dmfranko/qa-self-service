class IdUpdates < ActiveRecord::Migration
  def change
    rename_column :test_hierarchies,:test_platforms_id,:test_platform_id
    rename_column :tests,:app_id,:application_environment_id
  end
end
