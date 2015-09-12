class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true   
  #image用
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { maximum: 140 }



end
