class DashboardPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    super
  end

  def show?
    current_user.username = user.username
    super
  end

  def create?
    current_user.username = user.username
    super
  end

  def new?
    create?
  end

  def update?
    current_user.username = user.username
    super
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
end
