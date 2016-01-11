
Rails.application.routes.draw do
    root 'pages#dashboard'
    get 'dashboard' => 'pages#dashboard'
    devise_for :users, :controllers => { :registrations => "users" }
    devise_for :taxpayers, :controllers => { :registrations => "taxpayers"}

    resources :users, except: [:destroy]

    resources :taxpayers do
      match :delinquent, via: [:get], on: :collection
       match :with_pending_payments, via: [:get], on: :collection
      resources :businesses
      resources :cedulas
    end
    resources :businesses, except: [:destroy] do
      match :renew, via: [:get], on: :member
      match :registered, via: [:get], on: :collection
      match :delinquent, via: [:get], on: :collection
      match :payment_pending, via: [:get], on: :collection
      match :new_business, via: [:get], on: :collection
      match :owned_by_women, via: [:get], on: :collection
      match :expire, via: [:get, :post], on: :member
      match :retire, via: [:get, :post], on: :member
      match :revoke, via: [:get, :post], on: :member
      match :revoked, via: :get, on: :collection
      resources :payments, only: [:new, :create]
      resources :line_of_businesses
    end
          resources :payments,  only: [:index]
          resources :line_of_businesses

      get 'reports' => 'reports#index', as: 'reports'
      get 'quarterly_reports' => 'reports#quarterly', as: 'quarterly_reports'
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

      get 'registered_ahin' => 'businesses#registered_ahin'
      get 'registered_apapid' => 'businesses#registered_apapid'
      get 'registered_binablayan' => 'businesses#registered_binablayan'
      get 'registered_danggo' => 'businesses#registered_danggo'
      get 'registered_eheb' => 'businesses#registered_eheb'
      get 'registered_gumhang' => 'businesses#registered_gumhang'
      get 'registered_impugong' => 'businesses#registered_impugong'
      get 'registered_luhong' => 'businesses#registered_luhong'
      get 'registered_poblacion' => 'businesses#registered_poblacion'
      get 'registered_tukucan' => 'businesses#registered_tukucan'
      get 'registered_tulludan' => 'businesses#registered_tulludan'
      get 'registered_wangwang' => 'businesses#registered_wangwang'

      get 'dole_report' => 'businesses#dole_report'
      get 'sss_report' => 'businesses#sss_report'
      get 'registered_businesses_report' => 'businesses#registered_businesses_report'
      get 'new_businesses_report' => 'businesses#new_businesses_report'
      get 'unrenewed_businesses_report' => 'businesses#unrenewed_businesses_report'
      get 'bir_report' => 'businesses#bir_report'
  end
