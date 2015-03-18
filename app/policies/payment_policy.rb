class PaymentPolicy < ApplicationPolicy
  attr_reader :user, :payment

  def initialize(user, payment)
    @user = user
    @payment = payment
  end

  def index?
    true
  end

  def create?
  user.system_administrator? || user.payment_officer?
  end

  def new?
    user.system_administrator? || user.payment_officer?
  end


  def scope
    Pundit.policy_scope!(user, payment.class)
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

