class Like < ActiveRecord::Base
  belongs_to :image
  belongs_to :user
  validates :user, uniqueness: { scope: :image, message: 'has already liked this image' }
end
