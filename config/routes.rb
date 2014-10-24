Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    root to: "products#index"
    resources :products do
      collection do
        post :reorder
      end
    end
    resources :categories do
      collection do
        post :reorder
      end
    end
    resources :tags do
      collection do
        post :reorder
      end
    end
    resources :rentals do
      collection do
        get :pending
        get :approved
        get :rejected
      end
      member do
        get :send_invoice
        get :send_agreement
        get :reject
      end
    end
    resources :agreements
    resources :editables
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
  resources :rentals do
    collection do
      get :requested
    end
  end

  get '/countries/:country/states', to: 'countries#states'
  get "/cart", to: "carts#show"
  patch "/cart", to: "carts#update"
  put "/cart", to: "carts#update"
  get "/cart/check_availabilities", to: "carts#check_availabilities"
  get "/cart/checkout", to: "carts#checkout"

  get "/about", to: "home#about"
  get "/terms", to: "home#terms"
  get "/contact", to: "contacts#new"
  resource :contacts

  root to: "products#index"
end
