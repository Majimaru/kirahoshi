class PostReport < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :post
  
  # バリデーション
  validates :reason, presence: true, length: { maximum: 100 }
  
end
