class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #for current user to use through out the app
  helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by_id(session[:current_user_id])
    end
    def logged_in?
      current_user != nil
    end
end

  private
    def require_login
      unless logged_in?
        redirect_to root_path
      end
    end
