class ChangeApplicationEnvironmentIdToApplication < ActiveRecord::Migration
  def change
    rename_column :tests,:application_environment_id,:application_id
  end
end
