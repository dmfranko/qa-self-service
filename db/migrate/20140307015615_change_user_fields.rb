class ChangeUserFields < ActiveRecord::Migration
  def change
    rename_column :users, :name, :UserName
    rename_column :users, :netid, :NetworkIdentifier
    rename_column :users, :admin, :Administrator
  end
end
