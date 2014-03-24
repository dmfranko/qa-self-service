class ChangeUserNamesBack < ActiveRecord::Migration
  def change
    rename_column :users,:UserName, :name
    rename_column :users,:NetworkIdentifier,:netid
    rename_column :users,:administrator,:admin
  end
end
