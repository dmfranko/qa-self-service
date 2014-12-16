class Application < ActiveRecord::Base
  serialize :envs
  serialize :tags
  serialize :apps

  has_many :application_tags
  accepts_nested_attributes_for :application_tags,allow_destroy: true

  has_many :application_environments
  accepts_nested_attributes_for :application_environments,allow_destroy: true
  
  has_many :application_default_emails
  accepts_nested_attributes_for :application_default_emails,allow_destroy: true
  
  has_many :application_user_permissions
  has_many :users, through: :application_user_permissions 
  
  has_many :tests 
end
