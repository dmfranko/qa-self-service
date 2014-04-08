class TestOperatingSystem < ActiveRecord::Base
  has_many :platforms
  has_many :test_browsers, through: :platforms 
end
