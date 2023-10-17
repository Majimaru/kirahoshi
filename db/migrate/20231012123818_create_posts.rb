class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message, null: false
      t.string :review_item, null: false
      t.float :rate, null: false, default: 0.0

      t.timestamps
    end
  end
end
