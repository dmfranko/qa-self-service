class TestResultDetail < ActiveRecord::Base
  belongs_to :test_hierarchys
  has_many :test_result_exceptions,dependent: :destroy
end
