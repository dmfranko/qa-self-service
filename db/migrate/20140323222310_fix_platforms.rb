class FixPlatforms < ActiveRecord::Migration
  def change
    add_column :test_platforms,:test_browser_id,:belongs_to
    add_column :test_platforms,:test_operating_system_id,:belongs_to
  end
end
