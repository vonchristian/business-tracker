class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: :landing_page
  def landing_page
  end
end
