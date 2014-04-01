class TestRunPlatform < ActiveRecord::Base
  belongs_to :test_runs
  has_many :test_platforms
  
  has_many :test_hierarchies
end
