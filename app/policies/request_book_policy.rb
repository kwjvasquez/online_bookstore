# frozen_string_literal: true

class RequestBookPolicy < ApplicationPolicy
  include SuperAdminAccess

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
