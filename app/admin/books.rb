# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :code, :name, :description, :price, :number_of_pages,
                :date_published, :active, :author_id, :category_id, :tag_list,
                :cover

  active_admin_import

  form do |f|
    f.inputs do
      f.input :code
      f.input :name
      f.input :description
      f.input :price
      f.input :number_of_pages
      f.input :date_published
      f.input :author
      f.input :category
      f.input :cover, as: :file
      f.input :active
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :code
    column :name
    column :description
    column :price
    column :number_of_pages
    column :date_published
    column :author
    column :category
    column :active
    actions
  end

  filter :name
  filter :date_published
  filter :author
  filter :category

  show do
    attributes_table do
      row :code
      row :name
      row :description
      row :price
      row :number_of_pages
      row :date_published
      row :author
      row :category
      row :cover do
        image_tag resource.cover, width: 100 if resource.cover.attached?
      end
    end
  end

  action_item :versions, only: :show do
    link_to "Versions", versions_admin_book_path(resource)
  end

  member_action :versions, method: :get do
    @versions = resource.versions
  end

  controller do
    def do_import
      books_data = SmarterCSV.process(params[:active_admin_import_model][:file])
      ImportBooksJob.perform_later(books_data)
      redirect_to admin_books_path
    end
  end
end
