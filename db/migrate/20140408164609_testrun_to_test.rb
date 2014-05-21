class TestrunToTest < ActiveRecord::Migration
  def change
    rename_table :test_runs,:tests
  end
end
