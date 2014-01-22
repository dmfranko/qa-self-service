class App < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :envs
  serialize :tags
end
