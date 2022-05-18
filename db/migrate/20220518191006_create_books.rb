class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.text :description
      t.decimal :price, precision: 6, scale: 2, null: false
      t.integer :number_of_pages, null: false
      t.date :date_published, null: false
      t.boolean :active, default: false
      t.references :author, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :books, :code, unique: true
  end
end
