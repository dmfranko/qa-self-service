class RenameAppToApplication < ActiveRecord::Migration
  def change
    change_column :application_default_emails,:app_id,:application_id
    change_column :application_tags,:app_id,:application_id
    change_column :application_environments,:app_id,:application_id
    change_column :app_user_permissions,:app_id,:application_id
  end
end
