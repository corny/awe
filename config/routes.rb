Awemgmt::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :users, :except => [:new, :create]
  
  root :to => 'static#home'
  
end
