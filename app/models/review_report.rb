class ReviewReport < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :review
  
end
