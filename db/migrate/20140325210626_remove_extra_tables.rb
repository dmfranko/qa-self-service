class RemoveExtraTables < ActiveRecord::Migration
  def change
    drop_table :map_user_application_permissions
    drop_table :images
    drop_table :test_os
    drop_table :app_users
  end
end
