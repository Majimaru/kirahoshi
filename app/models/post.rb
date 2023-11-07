class Post < ApplicationRecord
  
  # 投稿画像
  has_one_attached :post_image
  
  # アソシエーション
  belongs_to :user
  belongs_to :genre
  
  has_many :reviews,        dependent: :destroy
  has_many :post_reports,   dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
  
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
  
  # ReviewテーブルにユーザーIDと投稿IDが一致するデータが存在するか確認
  def reviewed_by?(user)
    reviews.exists?(user_id: user.id)
  end
  
  # PostReportテーブルにユーザーIDと投稿IDが一致するデータが存在するか確認
  def post_reported_by?(user)
    post_reports.exists?(user_id: user.id)
  end
  
  # ユーザーIDと投稿IDが該当するレコードのrateカラムを取得
  def get_rate(user)
    reviews.select("rate").find_by(user_id: user.id)
  end
  
  # ユーザーIDと投稿IDが該当するレコードのrateカラムの平均値を取得
  def get_average_rate
    reviews.where(post_id: id).average(:rate).round(1)
  end
  
  # タグを保存する
  def save_tags(post_tags)
    # 対象の投稿のタグがTagテーブルにあれば、pluckで指定しているnameカラムを配列で格納
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在、postが持っているタグと、今回保存されたタグの差分を現在のタグとし、古いタグは削除
    old_tags = current_tags - post_tags
    # 今回保存されたタグと現在のタグの差分を新しいタグとし、新しいタグは保存
    new_tags = post_tags - current_tags

    # 古いタグを削除する
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_tag|
      new_tag = new_tag.downcase
      
      # 新しいタグが既にTagテーブルにあれば、TagRelationshipテーブルにのみ保存する
      if Tag.exists?(name: new_tag)
        old_tag = Tag.select("id").find_by(name: new_tag)
        TagRelationship.create(post_id: self.id, tag_id: old_tag.id)
      
      # 新しいタグを保存する
      else
        self.tags.find_or_create_by(name: new_tag)
      end
    end
  end
  
end
