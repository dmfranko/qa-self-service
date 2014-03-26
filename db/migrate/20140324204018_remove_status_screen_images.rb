class RemoveStatusScreenImages < ActiveRecord::Migration
  def change
    remove_column :screen_images,:status
  end
end
