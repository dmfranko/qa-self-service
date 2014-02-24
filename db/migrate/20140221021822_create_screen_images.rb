class CreateScreenImages < ActiveRecord::Migration
  def change
    create_table :screen_images do |t|
      t.belongs_to :screenshot
      t.text :os
      t.text :browser
      t.text :version
      t.text :image
      t.timestamps
    end
  end
end
