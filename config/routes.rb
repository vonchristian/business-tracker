
class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  constraints(SubdomainPresent) do
    root 'businesses#index', as: :subdomain_root
    devise_for :users, :controllers => { :registrations => "users" }

    resources :users
    resources :taxpayers do
      resources :businesses
      resources :payments
      resource :address
    end
    resources :businesses do
      resources :payments
      resource :required_documents
    end
          resources :requirements
          resources :taxes
          resources :documents
  end

   constraints(SubdomainBlank) do
    root 'static_pages#landing_page'
    resources :accounts, only: [:new, :create]
  end

end
