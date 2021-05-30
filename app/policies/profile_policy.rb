class ProfilePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def select_role?
    true
  end

  def assign_role?
    select_role?
  end

  def show?
    owner? || super
  end

  def create?
    return true if !@user.profile
  end

  def new?
    create?
  end

  def update?
    owner? || super
  end

  def edit?
    update?
  end

  def destroy?
    owner? || super
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

  def owner?
    user.id? || record.user == user
  end
end
