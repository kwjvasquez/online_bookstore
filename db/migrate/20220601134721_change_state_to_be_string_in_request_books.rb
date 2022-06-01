class ChangeStateToBeStringInRequestBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :request_books, :state, :string, default: "pending"
  end
end
