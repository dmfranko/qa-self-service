class CreateApplicationTags < ActiveRecord::Migration
  def change
    create_table :application_tags do |t|
      t.string :tag
      t.belongs_to :app
      t.timestamps
    end
  end
end
