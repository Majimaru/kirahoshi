class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.bigint :user_id, null: false
      # t.references :user, null: false, foreign_key: true
      t.bigint :genre_id, null: false
      # t.references :genre, null: false, foreign_key: true
      t.text :message, null: false
      t.string :review_item, null: false
      t.float :average_rate, null: false, default: 0.0

      t.timestamps
    end
  end
end
