Rails.application.routes.draw do

  get 'daily_sheet/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :payment_details
  resources :payments
  get 'welcome/index'
  resources :footwears
  resources :sale_details
  resources :sales
  resources :way_pays
  resources :trademarks
  resources :clients
  resources :categories
  resources :release_countries
  resources :sizes
  resources :seasons
  resources :colors
  resources :providers

  get 'welcome/index/:day/:month/:year' => 'welcome#index'
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'get_retail_price/:id' => 'footwears#get_retail_price'

  post 'get_fees/:total' => 'way_pays#get_fees'

  post 'get_client_debt/:id' => 'clients#get_client_debt'

  post 'get_way_pay_interest/:id/:fee' => 'way_pays#get_way_pay_interest'

  post 'get_footwear_id/:sku' => 'footwears#get_footwear_id'



end
