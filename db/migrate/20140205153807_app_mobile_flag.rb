class AppMobileFlag < ActiveRecord::Migration
  def change
    add_column :apps,:mobile,:boolean
  end
end
