class TagRelationship < ApplicationRecord
  
  # アソシエーション
  belongs_to :post
  belongs_to :tag
  
end
