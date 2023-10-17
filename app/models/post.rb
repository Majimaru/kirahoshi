class Post < ApplicationRecord
  
  # 投稿画像
  has_one_attached :post_image
  
  # アソシエーション
  belongs_to :user
  
  # バリデーション
  validates :message, presence: true, length: { maximum: 500 }
  validates :review_item, presence: true, length: { maximum: 10 }
  
  # validates :rate, numericality: {
  #   less_than_or_equal_to: 5,
  #   greater_than_or_equal_to: 0.5
  # }, presence: true
  
  # 投稿画像を表示
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/初期プロフィール画像.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
