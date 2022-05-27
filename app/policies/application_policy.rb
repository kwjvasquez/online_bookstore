# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    super_admin?
  end

  def new?
    create?
  end

  def update?
    super_admin?
  end

  def edit?
    update?
  end

  def destroy?
    super_admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end

    private

    attr_reader :user, :scope
  end

  protected

  def super_admin?
    user.has_role?("Super Admin")
  end

  def content_manager?
    user.has_role?("Content Manager")
  end
end
