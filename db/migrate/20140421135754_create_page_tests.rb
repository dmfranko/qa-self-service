class CreatePageTests < ActiveRecord::Migration
  def change
    create_table :page_tests do |t|
      t.timestamps
      t.belongs_to :page
      t.float :run_time
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
