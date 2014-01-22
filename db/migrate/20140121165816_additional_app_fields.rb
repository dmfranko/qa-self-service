class AdditionalAppFields < ActiveRecord::Migration
  def change
    add_column :apps, :tags, :text
    add_column :apps, :default_emails, :text
    add_column :apps, :envs, :text
  end
end
