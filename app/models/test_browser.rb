class TestBrowser < ActiveRecord::Base
  has_many :test_platforms
  has_many :test_operating_systems, through: :test_platforms 
end
