Zgzfts::Application.routes.draw do
  resources :distributions
  resources :notices
  resources :news
  resources :statics
  devise_for :admins
  resources :admins do
    authenticated :admin do
      root :to => 'admin#index'
    end
  end
  root :to => "home#index"
end
