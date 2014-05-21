class AddApplicationTables < ActiveRecord::Migration
  def change
    create_table :application_default_emails do |t|
      t.belongs_to :application
      t.string :email_address
      t.timestamps
    end
    create_table :application_environments do |t|
      t.belongs_to :application
      t.string :environment_name
      t.string :environment_url
      t.integer :is_available
      t.timestamps
    end
    create_table :application_tags do |t|
      t.belongs_to :application
      t.string :tag
      t.timestamps
    end
  end
end
