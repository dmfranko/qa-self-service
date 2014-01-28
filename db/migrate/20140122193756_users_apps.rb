class UsersApps < ActiveRecord::Migration
  def change
    add_column :users, :apps, :text
  end
end
