class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.text     :url
      t.text     :netid
      t.timestamps
    end
  end
end