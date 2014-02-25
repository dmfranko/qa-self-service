class AddStatusFieldToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :status, :text
  end
end
