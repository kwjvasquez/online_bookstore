# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_path,
                    alert: @user.errors.full_messages.join("\n")
      end
    end
  end
end
