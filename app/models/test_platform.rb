class TestPlatform < ActiveRecord::Base
  belongs_to :test_environment
  belongs_to :platform
  
  has_many :test_result_details, through: :test_hierarchies
  has_many :test_hierarchies,dependent: :destroy
end
