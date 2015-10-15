class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :images
  has_many :comments
  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  def has_liked?(image)
    liked_images.include? image
  end

end
