Rails.application.routes.draw do






  scope module: :public do
    resources :members, only: [:show,:update,:edit]
    get 'members/withdraw' => "members#withdraw"
    patch 'members/out' => "members#out"
    root to: "products#top"
    get 'products/about' => "products#about"
    resources :products, only:[:index,:show]
    get 'searches/search' => "searches#search"
    resources :orders, only:[:index,:show,:create]
    get 'orders/complete' => "orders#complete"
    get 'orders/:id/input' => "orders#input"
    post 'orders/:id/check' => "orders#check"
    resources :addresses, except:[:show,:new]
    resources :cart_products, only:[:show,:update,:destroy,]
    delete 'cart_products' => "cart_products#clear"
    post 'cart_products' => "cart_products#add_products"

  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :private do
    resources :products
    resources :members, only: [:index,:show,:edit,:update]
    resources :orders, only: [:index,:show,:update]
    resources :genres, only: [:index,:create,:edit,:update]
  end
  devise_for :admins
  devise_for :members


end
