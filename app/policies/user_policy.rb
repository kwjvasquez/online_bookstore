# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  include SuperAdminAccess

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
