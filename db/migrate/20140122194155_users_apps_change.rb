class UsersAppsChange < ActiveRecord::Migration
  def change
    change_column :users, :apps, :array
  end
end
