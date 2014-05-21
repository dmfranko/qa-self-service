class Test < ActiveRecord::Base
  belongs_to :application
  has_many :test_environments,dependent: :destroy
  
  has_many :test_platforms, through: :test_environments
  has_many :test_hierarchies, through: :test_platforms
  has_many :test_result_details, through: :test_hierarchies
end
