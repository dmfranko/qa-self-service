class Platform < ActiveRecord::Base
  belongs_to :test_browser
  belongs_to :test_operating_system
end
