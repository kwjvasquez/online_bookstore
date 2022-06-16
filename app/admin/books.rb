# frozen_string_literal: true

ActiveAdmin.register Book do
  permit_params :code, :name, :description, :price, :number_of_pages,
                :date_published, :active, :author_id, :category_id, :tag_list

  active_admin_import

  controller do
    def do_import
      books_data = SmarterCSV.process(params[:active_admin_import_model][:file])
      ImportBooksJob.perform_later(books_data)
      redirect_to admin_books_path
    end
  end
end
