class AddStatusField < ActiveRecord::Migration
  def change
    add_column :screen_images, :status, :text
  end
end
