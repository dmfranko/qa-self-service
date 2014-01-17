class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer  :app_id
      t.integer  :test_id
      t.float    :duration
      t.text     :description
      t.text     :notes
      t.text     :status
      t.timestamps
    end
  end
end
