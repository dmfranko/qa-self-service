class AddReportsColumn < ActiveRecord::Migration
  def up
    add_column :results, :exception_details, :text
  end

  def down
    remove_column :results, :exception_details, :text
  end
end
