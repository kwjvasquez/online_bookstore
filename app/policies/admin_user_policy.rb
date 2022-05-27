# frozen_string_literal: true

class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role?("Super Admin")
  end
end
