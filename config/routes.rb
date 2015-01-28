
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
      match :renew, via: [:get], on: :member
      match :expire, via: [:get, :post], on: :member
       match :retire, via: [:get, :post], on: :member
      resources :payments
      resource :mayors_permit_fees
      resource :required_documents
      resources :line_of_businesses
    end
          resources :requirements
          resources :taxes
          resources :documents
          resources :line_of_businesses
          resources :fees
          resources :payments
          resources :activities
          resource :searches
  end

   constraints(SubdomainBlank) do
    root 'static_pages#landing_page'
    resources :accounts, only: [:new, :create]
  end

end
