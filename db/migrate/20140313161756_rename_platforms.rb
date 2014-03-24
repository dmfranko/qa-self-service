class RenamePlatforms < ActiveRecord::Migration
  def change
    rename_table(:dim_available_test_platform,:dim_available_test_platforms)
  end
end
