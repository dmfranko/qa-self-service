class CreateTestEnvironments < ActiveRecord::Migration
  def change
    create_table :test_environments do |t|
      t.belongs_to :test
      t.integer :application_environment_id
      t.timestamps
    end
  end
end
