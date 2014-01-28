class AppUsers < ActiveRecord::Migration
  def change
    add_column :apps, :users, :text
  end
end
