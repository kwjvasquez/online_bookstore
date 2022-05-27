# frozen_string_literal: true

ActiveAdmin.register Comment do
  permit_params :message, :user_id, :book_id, :approved
end
