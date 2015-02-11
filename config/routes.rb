
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
       resources :police_clearances
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
    get 'reports' => 'reports#index', as: 'reports'
    get 'delinquents_ahin' => 'businesses#delinquents_ahin'
    get 'delinquents_apapid' => 'businesses#delinquents_apapid'
    get 'delinquents_binablayan' => 'businesses#delinquents_binablayan'
    get 'delinquents_danggo' => 'businesses#delinquents_danggo'
    get 'delinquents_eheb' => 'businesses#delinquents_eheb'
    get 'delinquents_gumhang' => 'businesses#delinquents_gumhang'
    get 'delinquents_impugong' => 'businesses#delinquents_impugong'
    get 'delinquents_luhong' => 'businesses#delinquents_luhong'
    get 'delinquents_poblacion' => 'businesses#delinquents_poblacion'
    get 'delinquents_tukucan' => 'businesses#delinquents_tukucan'
    get 'delinquents_tulludan' => 'businesses#delinquents_tulludan'
    get 'delinquents_wangwang' => 'businesses#delinquents_wangwang'
     get 'dole_report' => 'businesses#dole_report'
      get 'bir_report' => 'businesses#bir_report'

  end

   constraints(SubdomainBlank) do
    root 'static_pages#landing_page'
    resources :accounts, only: [:new, :create]
  end

end
