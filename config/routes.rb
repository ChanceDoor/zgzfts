Zgzfts::Application.routes.draw do
  resources :distributions
  resources :notices
  resources :news
  resources :statics
  devise_for :admin
  authenticated :admin do
    match "/admin", :to => 'admins#index',:as=>'admin_root'
  end
    devise_scope :admin do
       match "/admin" => "devise/sessions#new",:as => 'admin_root' 
    end
    #root :to =>'devise/sessions#new'

  resource :admin
  root :to => "home#index"
end
