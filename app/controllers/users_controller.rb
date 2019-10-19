class UsersController < ApplicationController

  def new

    if logged_in?
      redirect_to user_bizlists_path(current_user)
    else
      @user = User.new
    end

  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_bizlists_path(@user)
    else
      render :new
    end

  end

  def google_login

    @user = User.find_by(email: auth[:info][:email])

    if @user.nil?
      @user = User.new(
        email: auth[:info][:email],
        username: auth[:info][:name],
        password: SecureRandom.urlsafe_base64
      )
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_bizlists_path(@user)
    else
      render :new
    end

  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end
