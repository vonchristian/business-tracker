class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    true
  end

  def show?
    scope.where(:id => user.id).exists?
  end

  def create?
  current_user.system_administrator?
  end

  def new?
    create?
  end

  def update?
   current_user.system_administrator?
  end

  def edit?
    update?
  end

  def destroy?
    current_user.system_administrator?
  end

  def scope
    Pundit.policy_scope!(user, user.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
