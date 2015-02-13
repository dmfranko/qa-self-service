class TestResultDetail < ActiveRecord::Base
  belongs_to :test_hierarchy,foreign_key: "test_hierarchy_id"
  has_many :test_result_exceptions,dependent: :destroy
end
