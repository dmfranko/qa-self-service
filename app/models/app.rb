class App < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :envs
  serialize :tags
  serialize :apps
  serialize :default_emails
  
  has_many :app_users, dependent: :destroy
end
