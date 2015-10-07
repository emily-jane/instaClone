class Like < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  validates :user, uniqueness: { scope: :image }
end
