class Application < ActiveRecord::Base
  serialize :envs
  serialize :tags
  serialize :apps
  serialize :default_emails

  has_many :application_tags
  has_many :application_environments
  accepts_nested_attributes_for :application_environments
  
  has_many :application_default_emails
  
  has_many :application_user_permissions
  has_many :users, through: :application_user_permissions 
  
  has_many :tests 
end
