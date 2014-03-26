class RenameScreenImages < ActiveRecord::Migration
  def change
    rename_table :screen_images,:captured_screen_images
  end
end
