class AddRunFields < ActiveRecord::Migration
  def change
    add_column :runs, :browser, :text
    add_column :runs, :browser_version, :text
    add_column :runs, :os, :text
  end
end
