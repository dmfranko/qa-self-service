class CapturedPageImage < ActiveRecord::Base
  belongs_to :page_test
  belongs_to :platform
end
