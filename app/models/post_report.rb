class PostReport < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :post
  
  # バリデーション
  validates :reason, presence: true, length: { maximum: 100 }
  
  # enum
  enum status: { wait_response: 0, responded: 1 }
  
end
