# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:first_name, :last_name, :email,
                         :date_of_birth, :password, :password_confirmation)
    end
  end

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user.id : "Unknown User"
  end
end
