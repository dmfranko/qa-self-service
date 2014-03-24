class RenamePlatformTableAgain < ActiveRecord::Migration
  def change
    rename_table(:dim_available_test_platforms,:available_test_platforms)
  end
end
