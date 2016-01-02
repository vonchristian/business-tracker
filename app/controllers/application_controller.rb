class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private
        def permission_denied
          redirect_to root_path, alert: 'Access denied.'
        end

end
