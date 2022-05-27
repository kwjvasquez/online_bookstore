# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :code, :name, :description, :price, :number_of_pages,
                :date_published, :active, :author_id, :category_id, :tag_list
end
