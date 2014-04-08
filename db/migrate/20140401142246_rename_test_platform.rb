class RenameTestPlatform < ActiveRecord::Migration
  def change
    rename_table(:test_platforms,:platforms)
  end
end
