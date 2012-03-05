class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  
  def authenticate_admin!
    unless current_user.try(:admin?)
      flash[:error] = "admin required"
      redirect_to :root
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end
