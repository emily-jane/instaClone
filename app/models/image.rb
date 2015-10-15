class Image < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "480x480>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
  validates :name, length: {minimum: 1}
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates_presence_of :image

end
