class ChangeUserAdminField < ActiveRecord::Migration
  def change
        rename_column :users,:Administrator,:administrator
  end
end
