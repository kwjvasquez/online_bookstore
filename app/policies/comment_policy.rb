# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  include SuperAdminAccess

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
