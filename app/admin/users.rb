# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :first_name, :last_name, :date_of_birth
end
