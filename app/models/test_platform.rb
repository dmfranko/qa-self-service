class TestPlatform < ActiveRecord::Base
  belongs_to :test_runs
  has_one :platform
  
  has_many :test_hierarchies
end
