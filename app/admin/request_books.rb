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

  filter :user, as: :select, collection: proc { User.pluck(:email, :id) }
  filter :book
  filter :state, as: :select, collection: proc { RequestBook.states }

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: proc { User.pluck(:email, :id) }
      f.input :book
    end
    f.actions
  end

  action_item :review, only: :show do
    if request_book.pending?
      link_to "Review", review_admin_request_book_path(request_book),
              method: :patch
    end
  end

  action_item :ready, only: :show do
    if request_book.processing?
      link_to "Ready", ready_admin_request_book_path(request_book),
              method: :patch
    end
  end

  action_item :cancel, only: :show do
    if request_book.pending? || request_book.processing?
      link_to "Cancel", cancel_admin_request_book_path(request_book),
              method: :patch
    end
  end

  member_action :review, method: :patch do
    request_book = RequestBook.find(params[:id])
    request_book.review!
    redirect_to admin_request_book_path(request_book)
  end

  member_action :ready, method: :patch do
    request_book = RequestBook.find(params[:id])
    request_book.ready!
    redirect_to admin_request_book_path(request_book)
  end

  member_action :cancel, method: :patch do
    request_book = RequestBook.find(params[:id])
    request_book.cancel!
    redirect_to admin_request_book_path(request_book)
  end
end
