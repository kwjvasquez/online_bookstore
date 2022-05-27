# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false # set everything false remember.
  end

  def show?
    false # set everything false remember.
  end

  def create?
    false # set everything false remember.
  end

  def new?
    create?
  end

  def update?
    false # set everything false remember.
  end

  def edit?
    update?
  end

  def destroy?
    false # set everything false remember.
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
