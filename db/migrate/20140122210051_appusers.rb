class Appusers < ActiveRecord::Migration
  def change
    create_table :app_users do |t|
      t.belongs_to :apps
      t.integer  :app_id
      t.integer  :user_id
      t.timestamps
    end
  end
end
