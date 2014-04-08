class TestHierarchy < ActiveRecord::Base
  belongs_to :test_platforms
  has_many :test_result_details
end
