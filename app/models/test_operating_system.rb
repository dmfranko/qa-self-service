class TestOperatingSystem < ActiveRecord::Base
  has_many :test_platforms
  has_many :test_browsers, through: :test_platforms 
end
