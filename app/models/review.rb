class Review < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :post
  
  # バリデーション
  validates :user_id, uniqueness: {scope: :post_id}
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
  
end
