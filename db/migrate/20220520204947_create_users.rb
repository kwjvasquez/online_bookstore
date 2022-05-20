class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.date :date_of_birth

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
