class ScreenTableNames < ActiveRecord::Migration
  def change
    rename_table :screenshots,:pages
    rename_table :captured_screen_images,:captured_page_images
  end
end
