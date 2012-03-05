Awemgmt::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    delete "/sign_out" => "devise/sessions#destroy",  :as => :destroy_user_session
  end

  root :to => 'static#home'

end
