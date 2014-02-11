class GithubUrl < ActiveRecord::Migration
  def change
    add_column :apps,:github_url,:string
  end
end
