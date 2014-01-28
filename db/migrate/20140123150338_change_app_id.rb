class ChangeAppId < ActiveRecord::Migration
  def change
    rename_column :app_users,:apps_id, :app_id
  end
end
