class Book < ActiveRecord::Base
  default_scope order:  'id desc'
  belongs_to :admin
  attr_accessible :body, :cover, :posttime, :title,:price

  validates :title,:body, presence: true
  validates :cover, allow_blank: true, format:{with:/\.(png|jpg|gif)$/,message:'请上传图片'}
  validates_numericality_of :price,:greater_than_or_equal_to => 0.01
  mount_uploader :cover, BooksCoverUploader
end
