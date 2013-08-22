class News < ActiveRecord::Base
  belongs_to :admin
  attr_accessible :body, :posttime, :title
end
