Awemgmt::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    delete "/sign_out" => "devise/sessions#destroy",  :as => :destroy_user_session
  end
  
  resources :users, :except => [:new, :create]
  
  root :to => 'static#home'
  
end
