class Run < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :results, dependent: :destroy
end