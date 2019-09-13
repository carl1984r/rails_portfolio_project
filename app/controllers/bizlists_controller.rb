class BizlistsController < ApplicationController
  before_action :require_login
  before_action :init_user
  before_action :init_username
  before_action :init_user_bizlist

  def index
    @bizlists = current_user.bizlists
    @faves = current_user.favorite_businesses
    @businesses = Business.all
  end

  def new
    @bizlist = Bizlist.new
  end

  def create
    @bizlist = @user.bizlists.build(bizlist_params)
    if @bizlist.save
      flash[:message] = "Bizlist Successfully Created"
      redirect_to user_bizlists_path(current_user)
    else
      render :new
    end
  end

  def update
   @bizlist.update(bizlist_params)
   if @bizlist.save
     redirect_to bizlist_path(@bizlist)
     flash[:biz_updated] = "Bizlist updated"
   else
     render :edit
   end
 end

  private

  def init_user
    @user = User.find_by(id: params[:user_id])
  end

  def init_username
    @username = current_user.username
  end

  def bizlist_params
    params.require(:bizlist).permit(:name, :description, :user_id)
  end

  def init_user_bizlist
    @bizlist = Bizlist.find_by(id: params[:id])
  end

end
