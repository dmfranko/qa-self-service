class CreateAppUsers < ActiveRecord::Migration
  def change
      remove_column :app_users, :app_id
      add_column :app_users,:run,:boolean
      add_column :app_users,:view,:boolean
  end
end
