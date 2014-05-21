class Page < ActiveRecord::Base
  has_many :page_tests, :order => "start_time DESC"
end
