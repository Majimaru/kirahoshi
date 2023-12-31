class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # プロフィール画像
  has_one_attached :profile_image
  
  # アソシエーション
  has_many :posts,          dependent: :destroy
  has_many :reviews,        dependent: :destroy
  has_many :post_reports,   dependent: :destroy
  has_many :review_reports, dependent: :destroy
  has_many :contacts,       dependent: :destroy
         
  # バリデーション
  validates :user_name, presence: true, uniqueness:  true, length: { maximum: 15 }
  validates :email, presence: true
  
  # enum
  enum membership_status: { admission: 0, withdrawal: 1,  }
  
  # ユーザー新規登録時のみバリデーションを適用
  with_options on: :create do
    # 英数字が含まれたパスワードのみ許可
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字を両方含む必要があります" }
  end
  
  # プロフィール画像を表示
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/initial_profile.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # ゲストユーザーメールアドレス
  GUEST_USER_EMAIL = "guest@example.com"
  
  # ゲストログイン
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64(9) + "A1"
      user.user_name = "ゲストユーザー"
    end
  end
  
  # ログインユーザーがゲストか判定
  def guest_user?
    email == GUEST_USER_EMAIL
  end
  
  # 必要経験値に対する取得経験値の割合を取得
  def experience_percentage(thresold)
    self.experience_point.to_f / thresold.to_f * 100.round
  end
  
end
