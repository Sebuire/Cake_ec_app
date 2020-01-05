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
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
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
  get '/thanks' => 'top#thanks'
  # customersルーティング
  resources :customers, only: [:show, :edit, :update, :destroy]
  # itemsルーティング
  resources :items, only: [:index, :show]
  # genresルーティング
  resources :genres, only: [:show]
  # cartsルーティング
  resources :carts, only: [:index, :create, :update, :destroy]
  delete 'cart/delete/all' => 'carts#destroy_all', as: 'cart_delete_all'
  # ordersルーティング
  resources :orders, only: [:new, :create, :index]
  patch 'orders/new' => 'orders#new'
  post 'orders/show' => 'orders#show'
  get 'customer/order/:id' => 'orders#index', as: 'customer_order'
  # order_itemsルーティング
  resources :order_items, only: [:show, :index]
  # addressesルーティング
  resources :addresses, only: [:edit, :update, :index, :new, :create, :destroy]

  # adminsルーティング
  resources :admins, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # orderの確認画面のルーティング
  get '/orders/address' => 'orders#select_address'
  post '/orders/address' => 'orders#select_address'
  get '/orders/payment' => 'orders#select_payment'
  patch '/orders/payment' => 'orders#select_payment'
  get '/order/confirm' =>  'orders#confirm'
  post '/order/confirm' =>  'orders#confirm'
end
