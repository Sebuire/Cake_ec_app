Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :order_items, only: [:edit, :update]
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    resources :genres, only: [:new, :create, :edit, :update, :destroy, :index]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update, :destroy]
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
  resources :carts, only: [:index, :create, :update, :destroy]
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
