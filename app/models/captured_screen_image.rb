class CapturedScreenImage < ActiveRecord::Base
  belongs_to :screenshot
  has_one :platform
end
