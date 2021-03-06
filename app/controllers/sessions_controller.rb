class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_bizlists_path(current_user)
    end
  end

  def create

    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_bizlists_path(user)
    else
      flash.now[:login_error] = "Valid username and password required"
      render :new
    end

  end

  def destroy

    if logged_in?
      session.clear
      flash[:logged_out] = "Logged out"
      redirect_to '/'
    else

      redirect_back(fallback_location: root_path)
    end

  end


end
