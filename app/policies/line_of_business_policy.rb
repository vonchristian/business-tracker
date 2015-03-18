class LineOfBusinessPolicy < ApplicationPolicy
  attr_reader :user, :line_of_business

  def initialize(user, line_of_business)
    @user = user
    @business = business
  end

  def index?
    true
  end

  def show?
    scope.where(:id => business.id).exists?
  end

  def create?
  user.system_administrator? or user.application_officer?
  end

  def new?
    user.system_administrator? or user.application_officer?
  end

  def update?
    user.system_administrator? or user.application_officer? or not business.revoked?
  end

  def edit?
    user.system_administrator? or user.application_officer?
  end

  def destroy?
    user.system_administrator?
  end

  def scope
    Pundit.policy_scope!(user, line_of_business.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.system_administrator?
        scope.all
    end
  end
  end
end

