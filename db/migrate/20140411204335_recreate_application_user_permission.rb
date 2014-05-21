class RecreateApplicationUserPermission < ActiveRecord::Migration
  def change
    create_table :application_user_permissions do |t|
      t.belongs_to :user
      t.belongs_to :application
      t.timestamps
    end
  end
end
