class ProfilePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    super
  end

  def show?
    by_user? || super
  end

  def create?
    by_user? || super
  end

  def new?
    create?
  end

  def update?
    by_user? || super
  end

  def edit?
    update?
  end

  def destroy?
    super
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

  private

  def by_user?
    user.id? && record == user
  end
end

