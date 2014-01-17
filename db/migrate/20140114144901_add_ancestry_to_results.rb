class AddAncestryToResults < ActiveRecord::Migration
  def up
    add_column :results, :ancestry, :string
    add_index :results, :ancestry
  end
  def down
    remove_column :results, :ancestry, :string
    remove_index :results, :ancestry
  end
end
