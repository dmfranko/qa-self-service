class RemoveTestPlatformColumns < ActiveRecord::Migration
  def up
    execute "DROP TABLE test_platforms"
  end
end
  