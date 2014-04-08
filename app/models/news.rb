class News < ActiveRecord::Base
  default_scope order: 'posttime desc'
  belongs_to :admin
end
