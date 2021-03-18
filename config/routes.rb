Rails.application.routes.draw do

  # 会員側ルーティング
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }

  scope module: :public do
    root to: "products#top"

    get 'members/withdraw' => "members#withdraw"
    patch 'members/out' => "members#out"
    resources :members, only: [:show,:update,:edit]

    get 'products/about' => "products#about"
    resources :products, only:[:index,:show]

    get 'orders/complete' => "orders#complete"
    get 'orders/:id/input' => "orders#input"
    post 'orders/:id/check' => "orders#check"
    resources :orders, only:[:index,:show,:create]

    delete 'cart_products' => "cart_products#clear"
    post 'cart_products' => "cart_products#add_products"
    resources :cart_products, only:[:index,:update,:destroy,]

    resources :addresses, except:[:show,:new]

    get 'searches/search' => "searches#search"
  end

  # 管理者側ルーティング
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :private do
    resources :products
    resources :members, only: [:index,:show,:edit,:update]
    resources :orders, only: [:index,:show,:update]
    resources :genres, only: [:index,:create,:edit,:update]
  end
end
