class AppsChangeMobileTInt < ActiveRecord::Migration
  def change
    change_column :apps,:mobile,:integer,:default => 0
    rename_column :apps,:mobile, :is_application_mobile
  end
end
