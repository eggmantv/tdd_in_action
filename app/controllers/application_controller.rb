class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def auth_user
    unless logged_in?
      redirect_to new_session_path
    end
  end

  def logged_in?
    !session[:user_id].blank?
  end

  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

end
