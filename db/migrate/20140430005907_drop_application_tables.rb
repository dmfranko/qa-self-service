class DropApplicationTables < ActiveRecord::Migration
  def change
    drop_table :application_default_emails
    drop_table :application_environments
    drop_table :application_tags
  end
end
