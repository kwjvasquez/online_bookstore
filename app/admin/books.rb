# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :code, :name, :description, :price, :number_of_pages,
                :date_published, :active, :author_id, :category_id, :tag_list

  active_admin_import

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
