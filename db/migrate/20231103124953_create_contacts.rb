class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :classification,  null: false, default: 0
      t.text :message,  null: false
      t.integer :confirmation_status,  null: false, default: 0

      t.timestamps
    end
  end
end
