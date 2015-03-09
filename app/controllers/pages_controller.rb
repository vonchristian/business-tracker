class PagesController < ApplicationController
  def dashboard
    @taxpayers = Taxpayer.all
  end
end
