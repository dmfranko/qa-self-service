class RemoveApps < ActiveRecord::Migration
  def up
    remove_column :apps, :users
  end

  def down
    add_column :apps, :users
  end
end
