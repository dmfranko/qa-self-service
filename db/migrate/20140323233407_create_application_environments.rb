class CreateApplicationEnvironments < ActiveRecord::Migration
  def change
    create_table :application_environments do |t|
      t.string :environment_name
      t.string :environment_url
      t.integer :is_environment_available
      t.belongs_to :app
      t.timestamps
    end
  end
end
