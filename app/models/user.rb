class User < ActiveRecord::Base
  has_many :app_user_permissions
  has_many :apps, through: :app_user_permissions
end