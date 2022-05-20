class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :message, null: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
