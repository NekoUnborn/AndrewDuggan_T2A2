class JobPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    super
  end

  def show?
    owner? || super
  end

  def create?
    owner? || super
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
    user.id? || (user.has_role? :user)
  end
end
