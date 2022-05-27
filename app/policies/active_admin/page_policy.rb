# frozen_string_literal: true

module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def show?
      true
    end
  end
end
