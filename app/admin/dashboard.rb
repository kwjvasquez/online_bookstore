# frozen_string_literal: true

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    panel "General activivy" do
      table_for PaperTrail::Version.order("id desc").limit(10) do
        column("Book ID", &:item_id)
        column("Name") { |book_version| book_version.reify&.name }
        column("Event", &:event)
        column("User") do |book_version|
          AdminUser.find(book_version.whodunnit) if book_version.whodunnit
        end
        column("Time", &:created_at)
      end
    end
  end
end
