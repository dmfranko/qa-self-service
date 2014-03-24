class CreateTestPlatforms < ActiveRecord::Migration
  def change
    create_table :test_platforms do |t|

      t.timestamps
    end
  end
end
