class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :long_name
      t.string :long_version
      t.string :os
      t.timestamps
    end
  end
end