class AppToApplication < ActiveRecord::Migration
  def change
    rename_table :apps,:applications
  end
end
