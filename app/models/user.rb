class User < ActiveRecord::Base
  has_many :application_user_permissions
  has_many :applications, through: :application_user_permissions
end