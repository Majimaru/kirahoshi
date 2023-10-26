class CreateReviewReports < ActiveRecord::Migration[6.1]
  def change
    create_table :review_reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true
      t.string :reason, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end