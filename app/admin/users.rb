# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation,
                :first_name, :last_name, :date_of_birth, :avatar

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :date_of_birth
      f.input :email, as: :email
      f.input :avatar, as: :file
      if params[:action] == "new"
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :date_of_birth
    column :email
    actions
  end

  filter :last_name
  filter :first_name
  filter :email
  filter :date_of_birth

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :date_of_birth
      row :email
      row :avatar do
        image_tag resource.avatar if resource.avatar.attached?
      end
    end
  end
end
