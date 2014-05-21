class AddPlatformIdToCapturedPageImage < ActiveRecord::Migration
  def change
    add_column :captured_page_images,:platform_id,:integer
  end
end
