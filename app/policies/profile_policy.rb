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
    made_by_current_user? || super
  end

  def create?
    made_by_current_user? || super
  end

  def new?
    create?
  end

  def update?
    made_by_current_user? || super
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

  def made_by_current_user?
    current_user? && record == current_user
  end
end

