class ApplicationController < ActionController::Base
  include Pundit
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  protect_from_forgery with: :exception

 # after_action :verify_authorized, :except => :index
  before_filter :load_schema, :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Enforces access right checks for individuals resources
  #after_filter :verify_authorized, :except => :index

  # Enforces access right checks for collections
 # after_filter :verify_policy_scoped, :only => :index




  private
        def load_schema
          Apartment::Tenant.switch('public')
          return unless request.subdomain.present?
          if current_account
            Apartment::Tenant.switch(request.subdomain)
          else
            redirect_to root_url(subdomain: false)
          end
        end

        def current_account
          @current_account ||= Account.find_by(subdomain: request.subdomain)
        end
        helper_method :current_account

        def after_sign_out_path_for(resource_or_scope)
          new_user_session_path
        end

        def permission_denied
redirect_to root_path, alert: 'Permision Denied'
end


end
