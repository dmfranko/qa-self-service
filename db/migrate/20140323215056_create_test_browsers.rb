class CreateTestBrowsers < ActiveRecord::Migration
  def change
    create_table :test_browsers do |t|
      t.string :browser_name
      t.string :browser_version
      t.timestamps
    end
  end
end
