class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    if !logged_in?
        redirect_to login_path
    end
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
      current_user
  end
end
