# frozen_string_literal: true

module ContentManagerAccess
  def index?
    user_access
  end

  def show?
    user_access
  end

  def create?
    user_access
  end

  def new?
    create?
  end

  def update?
    user_access
  end

  def edit?
    update?
  end

  def destroy?
    user_access
  end

  private

  def user_access
    @user.has_role?("Content Manager") || @user.has_role?("Super Admin")
  end
end
