class Post < ApplicationRecord
  
  has_one_attached :image
  
  # アソシエーション
  belongs_to :user
  
  # バリデーション
  validates :message, presence: true, length: { maximum: 500 }
  
end
