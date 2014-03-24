class CreateApplicationDefaultEmails < ActiveRecord::Migration
  def change
    create_table :application_default_emails do |t|
      t.string :email_address
      t.belongs_to :app
      t.timestamps
    end
  end
end
