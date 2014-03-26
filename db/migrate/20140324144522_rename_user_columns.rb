class RenameUserColumns < ActiveRecord::Migration
  def change
    rename_column :users,:admin, :is_administrator
    rename_column :users,:name, :user_name
  end
end
