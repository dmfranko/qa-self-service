class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer  :app_id
      t.integer  :test_id
      t.float    :duration
      t.text     :description
      t.text     :status
      t.text     :location
      t.text     :exception
      t.timestamps
    end
  end
end
