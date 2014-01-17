class Result < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :run
  has_ancestry
end
