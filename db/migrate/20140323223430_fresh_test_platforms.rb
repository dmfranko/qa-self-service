class FreshTestPlatforms < ActiveRecord::Migration
  def change
    create_table :test_platforms do |t|
      t.belongs_to :test_browser
      t.belongs_to :test_operating_system
      t.integer :is_available_in_cloud
      t.timestamps
    end
  end
end
