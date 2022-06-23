# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :name, :photo

  form do |f|
    f.inputs do
      f.input :name
      f.input :photo, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  show do
    attributes_table do
      row :name
      row :photo do
        image_tag resource.photo if resource.photo.attached?
      end
    end
  end
end
