class Notice < ActiveRecord::Base
  default_scope order:'posttime desc'
  belongs_to :admin
  #attr_accessible :body, :posttime, :title
end
