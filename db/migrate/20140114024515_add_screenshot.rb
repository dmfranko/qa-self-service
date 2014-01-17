class AddScreenshot < ActiveRecord::Migration
  def up
    add_column :results, :screenshot, :string
  end

  def down
    remove_column :results, :screenshot, :string
  end
end
