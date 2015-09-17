class Comment < ActiveRecord::Base

  belongs_to :image
  belongs_to :user
  validates :user, uniqueness: { scope: :image, message: "has commented on this image already" }

end
