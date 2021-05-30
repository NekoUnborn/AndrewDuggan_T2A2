class RolePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    super
  end

  def show?
    super
  end

  def create?
    super
  end

  def new?
    create?
  end

  def update?
    super
  end

  def edit?
    update?
  end

  def destroy?
    super
  end

  def remove_role_from_user?
    user.has_role? :admin
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end

