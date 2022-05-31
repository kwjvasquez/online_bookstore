# frozen_string_literal: true

class AdminUserPolicy < ApplicationPolicy
  def index?
    super_admin?
  end

  def show?
    super_admin?
  end
end
