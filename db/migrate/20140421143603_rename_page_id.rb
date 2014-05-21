class RenamePageId < ActiveRecord::Migration
  def change
    rename_column :captured_page_images,:page_id,:page_test_id
  end
end