class ApplicationController < ActionController::Base
  include Pundit
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  protect_from_forgery with: :exception

 # after_action :verify_authorized, :except => :index
  before_filter :load_schema, :authenticate_user!

  private
        def load_schema
          Apartment::Database.switch('public')
          return unless request.subdomain.present?
          if current_account
            Apartment::Database.switch(request.subdomain)
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
end
