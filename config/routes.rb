Rails.application.routes.draw do
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
    get 'orders/edit'
    get 'orders/update'
  end
  namespace :admin do
    get 'order_items/index'
    get 'order_items/show'
    get 'order_items/edit'
    get 'order_items/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/destroy'
  end
  namespace :admin do
    get 'genres/new'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'genres/destroy'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/destroy'
  end
  # customers用のdeviseルーティング
  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  :registrations => 'customers/registrations'
  }
  # admins用のdeviseルーティング
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  :registrations => 'admins/registrations'
  }
  # adminのnamespace
  # namespace :admin do
  #   # adminのcustomersルーティング
  #   resources :customers, only: [:index, :show, :edit, :update, :destroy]
  #   # adminのitemsルーティング
  #   resources :items
  #   # adminのgenresルーティング
  #   resources :genres, only: [:new, :create, :edit, :update, :destroy]
  #   # adminのordersルーティング
  #   resources :orders, only: [:index, :show, :edit, :update]
  #   # adminのorder_itemsルーティング
  #   resources :order_items, only: [:show, :edit, :update]
  # end

  # topルーティング
  root to: 'top#top'
  get '/about' => 'top#about'
  get '/guide' => 'top#guide'
  # customersルーティング
  resources :customers, only: [:show, :edit, :update, :destroy]
  # itemsルーティング
  resources :items, only: [:index, :show]
  # genresルーティング
  resources :genres, only: [:show]
  # cartsルーティング
  resources :carts, only: [:index, :create]
  # ordersルーティング
  resources :orders, only: [:new, :create, :index]
  # order_itemsルーティング
  resources :order_items, only: [:show]
  # addressesルーティング
  resources :addresses, only: [:edit, :update, :index]

  # adminsルーティング
  resources :admins, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
