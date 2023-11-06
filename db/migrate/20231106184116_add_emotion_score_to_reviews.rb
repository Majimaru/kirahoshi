class AddEmotionScoreToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :emotion_score, :decimal, precision: 5, scale: 3, null: false, default: 0.0
  end
end
