class Book < ActiveRecord::Base
  belongs_to :admin
  attr_accessible :body, :cover, :posttime, :title
  mount_uploader :cover, BooksCoverUploader
end
