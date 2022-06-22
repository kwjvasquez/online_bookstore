# frozen_string_literal: true

ActiveAdmin.register RequestBook do
  permit_params :user_id, :book_id

  index do
    selectable_column
    id_column
    column :book
    column :user
    column :created_at
    tag_column :state
    actions
  end

  show do
    attributes_table do
      row :book
      row :user
      row :created_at
      state_row :state
    end
  end

  filter :user, as: :select, collection: proc { User.pluck(:email, :id) }
  filter :book

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.pluck(:email, :id)
      f.input :book
    end
    f.actions
  end

  action_item :review, only: :show do
    if resource.pending?
      link_to "Review", review_admin_request_book_path(resource),
              method: :patch
    end
  end

  action_item :ready, only: :show do
    if resource.processing?
      link_to "Ready", ready_admin_request_book_path(resource),
              method: :patch
    end
  end

  action_item :cancel, only: :show do
    if resource.pending? || resource.processing?
      link_to "Cancel", cancel_admin_request_book_path(resource),
              method: :patch
    end
  end

  member_action :review, method: :patch do
    resource.review!

    redirect_to resource_path(resource)
  end

  member_action :ready, method: :patch do
    resource.ready!

    SendgridMailer.send(
      to: resource.user.email,
      subsitutions: {
        firstName: resource.user.first_name,
        lastName: resource.user.last_name,
        bookName: resource.book.name,
        state: resource.state
      },
      template_id: ENV.fetch("TEMPLATE_ID", nil)
    )

    redirect_to resource_path(resource), notice: "Email notification sent!"
  end

  member_action :cancel, method: :patch do
    resource.cancel!

    redirect_to resource_path(resource)
  end
end
