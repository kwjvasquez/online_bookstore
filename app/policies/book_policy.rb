# frozen_string_literal: true

class BookPolicy < ApplicationPolicy
  def create?
    super_admin? || content_manager?
  end

  def new?
    create?
  end

  def update?
    super_admin? || content_manager?
  end

  def edit?
    update?
  end

  def destroy?
    super_admin? || content_manager?
  end

  def import?
    super_admin?
  end

  def do_import?
    super_admin?
  end

  def versions?
    super_admin?
  end
end
