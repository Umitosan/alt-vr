class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def authorize_user
    if !current_user
      flash[:alert] = "Please sign in first"
      redirect_to '/'
    end
  end

  def authorize_admin
    if !current_user
      flash[:alert] = "Please sign in first"
      redirect_to '/'
    elsif current_user && !current_user.admin
      flash[:alert] = "Only admins can perform that action"
      redirect_to '/'
    end
  end

end
