class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :images
  has_many :comments
  has_many :commented_images, through: :comments, source: :image

  def has_commented?(image)
    commented_images.include? image
  end
end
