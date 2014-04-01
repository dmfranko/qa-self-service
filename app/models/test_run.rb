class TestRun < ActiveRecord::Base
  belongs_to :application_environment
  has_many :test_run_platforms
end
