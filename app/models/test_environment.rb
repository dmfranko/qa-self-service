class TestEnvironment < ActiveRecord::Base
  belongs_to :test
  belongs_to :application_environment
  
  has_many :test_hierarchies, through: :test_platforms
  has_many :test_platforms,dependent: :destroy
end
