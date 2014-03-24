class CreateTestOperatingSystems < ActiveRecord::Migration
  def change
    create_table :test_operating_systems do |t|
      t.string :operating_system_name
      t.timestamps
    end
  end
end
