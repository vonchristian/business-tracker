
Rails.application.routes.draw do



    root 'pages#dashboard'
     get 'dashboard' => 'pages#dashboard', as: 'dashboard'
    devise_for :users, :controllers => { :registrations => "users" }

    resources :users
    resources :taxpayers do
      match :delinquent, via: [:get], on: :collection
       match :with_pending_payments, via: [:get], on: :collection
      resources :businesses
       resources :police_clearances
      resources :payments
      resources :cedulas
    end
    resources :businesses do
      match :renew, via: [:get], on: :member
       match :registered, via: [:get], on: :collection
       match :delinquent, via: [:get], on: :collection
       match :new_business, via: [:get], on: :collection
        match :owned_by_women, via: [:get], on: :collection
      match :expire, via: [:get, :post], on: :member
       match :retire, via: [:get, :post], on: :member
       match :revoke, via: [:get, :post], on: :member
       match :revoked, via: :get, on: :collection
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
      get 'sss_report' => 'businesses#sss_report'
      get 'registered_businesses_report' => 'businesses#registered_businesses_report'
      get 'unrenewed_businesses_report' => 'businesses#unrenewed_businesses_report'
      get 'bir_report' => 'businesses#bir_report'

  end



