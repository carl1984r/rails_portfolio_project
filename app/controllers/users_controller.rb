class UsersController < ApplicationController

  helper_method :logged_in?, :current_user
  layout "static"

  def new

    if logged_in?
      redirect_to user_watchlists_path(current_user)
    else
      @user = User.new
    end

  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
