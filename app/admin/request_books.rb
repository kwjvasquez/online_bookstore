# frozen_string_literal: true

ActiveAdmin.register RequestBook do
  permit_params :user_id, :book_id

  index do
    selectable_column
    id_column
    column :book
    column :user
    column :created_at
    column :state
    actions
  end

  filter :user, as: :select, collection: User.pluck(:email, :id)
  filter :book
  filter :state, as: :select, collection: RequestBook.states

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.pluck(:email, :id)
      f.input :book
    end
    f.actions
  end
end
