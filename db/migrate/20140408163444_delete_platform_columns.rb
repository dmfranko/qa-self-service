class DeletePlatformColumns < ActiveRecord::Migration
  def change
      remove_column :captured_screen_images,:browser
      remove_column :captured_screen_images,:os
      remove_column :captured_screen_images,:version

  end
end
