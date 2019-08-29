class ApplicationController < ActionController::Base

  def logged_in?
    !!current_user
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end

end
