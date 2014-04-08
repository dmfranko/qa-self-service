class TestBrowser < ActiveRecord::Base
  has_many :platforms
  has_many :test_operating_systems, through: :platforms 
end
