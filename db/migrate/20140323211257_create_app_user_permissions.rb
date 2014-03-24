class CreateAppUserPermissions < ActiveRecord::Migration
  def change
    create_table :app_user_permissions do |t|
      t.belongs_to :user
      t.belongs_to :app
      t.timestamps
    end
  end
end
