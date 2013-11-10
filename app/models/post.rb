class Post < ActiveRecord::Base
  attr_accessible :title, :body, :posttime, :editor_id

  belongs_to :editor
end
