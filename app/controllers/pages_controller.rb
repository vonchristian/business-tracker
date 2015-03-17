class PagesController < ApplicationController
  def dashboard
    @taxpayers = Taxpayer.all
    @businesses = Business.all
    @payments = Payment.all
  end
end
