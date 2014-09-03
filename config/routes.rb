Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
    resources :categories
    resources :rentals do
      collection do
        get :pending
        get :approved
        get :rejected
      end
    end
  end

  resources :products
  resources :categories do
    resources :tags
  end

  namespace :cart do
    resources :items do
      collection do
        post :add
        delete :remove
      end
    end
  end

  get "/cart", to: "carts#show"
  patch "/cart", to: "carts#update"
  put "/cart", to: "carts#update"
  get "/cart/check_availabilities", to: "carts#check_availabilities"
  get "/cart/checkout", to: "carts#checkout"

  root to: "products#index"
end
