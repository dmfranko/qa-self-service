class AddEmailToTest < ActiveRecord::Migration
  def change
    add_column :tests,:result_emails,:string
  end
end
