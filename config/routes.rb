Zgzfts::Application.routes.draw do
  captcha_route
  resources :books
  resources :distributions
  resources :notices
  resources :news
  resources :statics
  resources :outsourcing
  resources :editors
  resources :posts

  resource :order do
    root to: "orders#books", as: :order
    get "/books", to: 'orders#books', as: :books
    get "/brochures", to: 'orders#brochures', as: :brochures
    get "/magazines", to: 'orders#magazines', as: :magazines
  end
  resources :orders

  devise_for :admin
  #devise_for :admin
    authenticated :admin do
      get "/admin", to: 'admins#index', as: :authenticated_root
    end
    devise_scope :admin do
      unauthenticated :admin do
        get "/admin", to: 'devise/sessions#new', as: :unauthenticated_root
      end
    end
  #devise_scope :admin do
  #  get "/admin", to: "devise/sessions#new", as: 'admin_root'
  #end

  resource :admin
  root to: "home#index"
end
