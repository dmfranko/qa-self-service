class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.string :test_run_description
      t.string :test_run_note
      t.belongs_to :app
      t.timestamps
    end
  end
end
