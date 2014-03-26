class RemoveAppColumns < ActiveRecord::Migration
  def change
    remove_column :apps,:envs
    remove_column :apps,:default_emails
    remove_column :apps,:tags
  end
end
