class ChangeTestIdToTestEnvironment < ActiveRecord::Migration
  def change
    rename_column :test_platforms,:test_id,:test_environment_id
  end
end
