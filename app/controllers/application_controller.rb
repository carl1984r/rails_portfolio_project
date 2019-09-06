class ApplicationController < ActionController::Base

  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

  def require_login
    unless logged_in?
      flash[:login] = "Please login to view content."
      redirect_to login_path
    end
  end

end
