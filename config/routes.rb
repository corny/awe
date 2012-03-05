Awemgmt::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :users, :except => [:new, :create]
  resources :courses do
    resources :groups
    resources :projects
  end
  
  root :to => 'courses#index'
  
end
