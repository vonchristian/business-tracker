class TaxpayerPolicy < ApplicationPolicy
  attr_reader :user, :taxpayer

  def initialize(user, taxpayer)
    @user = user
    @taxpayer = taxpayer
  end

  def index?
    true
  end

  def show?
    scope.where(:id => taxpayer.id).exists?
  end

  def create?
  user.system_administrator? or user.application_officer?
  end

  def new?
    user.system_administrator? or user.application_officer?
  end

  def update?
    user.system_administrator? or user.application_officer?
  end

  def edit?
    user.system_administrator? or user.application_officer?
  end

  def destroy?
    user.system_administrator?
  end

  def scope
    Pundit.policy_scope!(user, taxpayer.class)
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

