class RenamePlatformLower < ActiveRecord::Migration
  def change
    rename_table(:Dim_Available_Test_Platforms,:dim_available_test_platform)
  end
end
