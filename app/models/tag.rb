class Tag < ApplicationRecord
  
  # アソシエーション
  has_many :tag_relationships, dependent: :destroy
  has_many :posts, through: :tag_relationships
  
  def self.search_for(content, method)
    if method == "perfect"
      tags = Tag.where(name: content)
    end

    tags.inject(init = []) { |result, tag| result + tag.books }
  end
  
end
