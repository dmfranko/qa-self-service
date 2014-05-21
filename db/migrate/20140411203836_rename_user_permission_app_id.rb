class RenameUserPermissionAppId < ActiveRecord::Migration
  def change
    drop_table :application_user_permissions
  end
end
