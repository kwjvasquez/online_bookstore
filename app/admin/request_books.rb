# frozen_string_literal: true

ActiveAdmin.register RequestBook do
  permit_params :user_id, :book_id
end
