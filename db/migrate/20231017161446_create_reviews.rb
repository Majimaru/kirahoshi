class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.float :rate, null: false, default: 0.0

      t.timestamps
    end
  end
end
