class Editor < ActiveRecord::Base
  #attr_accessible :name, :portrait, :resume, :level
  mount_uploader :portrait, EditorUploader
  has_many :posts
end
