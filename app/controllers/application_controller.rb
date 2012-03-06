class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :development_mode?
  helper_method :admin?
  
  protected
  
  def development_mode?
    Rails.env.development?
  end
  
  def admin?
    current_user.try(:admin?)
  end
  
  def authenticate_admin!
    unless admin?
      flash[:error] = "admin required"
      redirect_to :back
    end
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end
