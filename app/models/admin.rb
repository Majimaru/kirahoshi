class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # バリデーション
  validates :email, presence: true
  
  # 管理者の新規登録時のみバリデーションを適用
  with_options on: :create do
    # 英数字が含まれたパスワードのみ許可
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字を両方含む必要があります" }
  end
end
