class PageTest < ActiveRecord::Base
  has_many :captured_page_images
  belongs_to :page
end

