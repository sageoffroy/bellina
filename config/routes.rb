Rails.application.routes.draw do
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

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'get_retail_price/:id' => 'footwears#get_retail_price'

end
