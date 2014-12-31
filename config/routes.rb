
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
    root 'taxpayers#index', as: :subdomain_root
    devise_for :users
    resources :users
    resources :taxpayers do
      resources :businesses
    end
  end

   constraints(SubdomainBlank) do
    root 'static_pages#landing_page'
    resources :accounts, only: [:new, :create]
  end

end
