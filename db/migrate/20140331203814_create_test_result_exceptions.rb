class CreateTestResultExceptions < ActiveRecord::Migration
  def change
    create_table :test_result_exceptions do |t|
      t.belongs_to :test_result_details
      t.text :exception_text
      t.text :exception_debug_details
      t.string :exception_screenshot
      t.timestamps
    end
  end
end
