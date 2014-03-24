class RenamePlatformsTable < ActiveRecord::Migration
  def change
    rename_table(:platforms,:Dim_Available_Test_Platforms)
  end
end
