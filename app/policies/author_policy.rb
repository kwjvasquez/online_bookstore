# frozen_string_literal: true

class AuthorPolicy < ApplicationPolicy
  include ContentManagerAccess

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
