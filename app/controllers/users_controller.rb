class UsersController < ApplicationController

  helper_method :logged_in?, :current_user

  def new

    if logged_in?
      redirect_to user_watchlists_path(current_user)
    else
      @user = User.new
    end

  end

end
