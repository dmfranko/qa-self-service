class RenameScreenshotColumn < ActiveRecord::Migration
  def change
    rename_column :captured_page_images,:screenshot_id,:page_id
  end
end
