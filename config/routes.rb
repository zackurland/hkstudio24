Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products
    resources :categories
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

  root to: "products#index"
end
