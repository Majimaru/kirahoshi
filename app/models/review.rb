class Review < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :post
  
  has_many :review_reports, dependent: :destroy
  
  # バリデーション
  validates :user_id, uniqueness: {scope: :post_id}
  
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true
  
  validates :comment, length: { maximum: 100 }
  
  # ReviewReportテーブルにユーザーIDとレビューIDが一致するデータが存在するか確認
  def review_reported_by?(user)
    review_reports.exists?(user_id: user.id)
  end
  
end
