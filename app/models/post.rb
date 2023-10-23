class Post < ApplicationRecord
  
  # 投稿画像
  has_one_attached :post_image
  
  # アソシエーション
  belongs_to :user
  has_many :reviews, dependent: :destroy
  
  # バリデーション
  validates :message, presence: true, length: { maximum: 500 }
  validates :review_item, presence: true, length: { maximum: 10 }
  
  # 投稿画像を表示
  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/初期プロフィール画像.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # Reviewテーブルに自信のユーザーIDが存在するか確認
  def reviewed_by?(user)
    reviews.exists?(user_id: user.id)
  end
  
  # ユーザーIDと投稿IDが該当するレコードのrateカラムを取得
  def get_rate(user)
    reviews.select("rate").find_by(user_id: user.id)
  end
  
end
