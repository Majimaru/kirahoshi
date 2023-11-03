class Contact < ApplicationRecord

  # アソシエーション
  belongs_to :user

  # バリデーション
  validates :message, presence: true, length: { maximum: 500 }

  # enum
  enum classification: { opinion: 0, question: 1, contact_request: 2 }
  enum confirmation_status: { unconfirmed: 0, confirmed: 1, adopt: 2, responded: 3 }

end
