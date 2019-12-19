Rails.application.routes.draw do
  # devise_for :customers
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  :registrations => 'customers/registrations'
  }
  # devise_for :admins
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  :registrations => 'admins/registrations'
  }
  # adminのnamespace
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
    resources :items
    resources :genres, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:show, :edit, :update]
  end

  # top
  root to: 'top#top'
  get '/about' => 'top#about'
  get '/guide' => 'top#guide'
  # customers
  resources :customers, only: [:show, :edit, :update, :destroy]
  # items
  resources :items, only: [:index, :show]
  # genres
  resources :genres, only: [:show]
  # carts
  resources :carts, only: [:index, :create]
  # orders
  resources :orders, only: [:new, :create, :index]
  # order_items
  resources :order_items, only: [:show]
  # addresses
  resources :addresses, only: [:edit, :update, :index]

  # admins
  resources :admins, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
