class Notice < ActiveRecord::Base
  belongs_to :admin
  attr_accessible :body, :posttime, :title
end
