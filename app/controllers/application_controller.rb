class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  protect_from_forgery with: :exception

 # after_action :verify_authorized, :except => :index
  before_filter :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Enforces access right checks for individuals resources
  #after_filter :verify_authorized, :except => :index

  # Enforces access right checks for collections
 # after_filter :verify_policy_scoped, :only => :index

  private
        def permission_denied
redirect_to root_path, alert: 'Unauthorized Access!'
end


end
