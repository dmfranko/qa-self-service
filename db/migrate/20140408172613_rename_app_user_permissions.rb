class RenameAppUserPermissions < ActiveRecord::Migration
  def change
    rename_table :app_user_permissions,:application_user_permissions
  end
end
