# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "Books Activity" do
      table_for Book.order("updated_at desc").limit(5).each do
        column("Code", &:code)
        column("Name") { |book| link_to(book.name, admin_book_path(book)) }
        column("Active") { |book| status_tag(book.active) }
        column("Activity") { |book| book.versions.last.event }
        column("User") do |book|
          user_id = book.versions.last.whodunnit
          AdminUser.find(book.versions.last.whodunnit).email if user_id
        end
      end
    end
  end
end
