class ChangeTestPlaformsColumn < ActiveRecord::Migration
  def change
  rename_column :test_platforms,:test_platforms_id,:platforms_id
  end
end
