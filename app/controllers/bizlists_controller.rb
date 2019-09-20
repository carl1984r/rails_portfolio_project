class BizlistsController < ApplicationController
  before_action :require_login
  before_action :init_user
  before_action :init_username
  before_action :init_user_bizlist, only: [:show, :edit, :update, :destroy]

  def index
    @bizlists = current_user.bizlists
    @businesses = Business.all
  end

  def new
    @bizlist = Bizlist.new
  end

  def add
    @bizlist = Bizlist.find_by(id: params[:bizlist_id])
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
    if !!Business.find_by(id: params[:bizlist]['add_to']) && !@bizlist.businesses.find_by(id: params[:bizlist]['add_to'])
      @bizlist.businesses << Business.find_by(id: params[:bizlist]['add_to'])
      redirect_to bizlist_path(@bizlist)
      flash[:biz_added] = "Biz successfully added to this bizlist"
    else
      @bizlist.update(bizlist_params)
        if @bizlist.save
          redirect_to bizlist_path(@bizlist)
            flash[:biz_updated] = "Bizlist updated"
        else
          render :edit
        end
    end
 end

 def destroy
    if @bizlist
      @bizlist.destroy
      redirect_to user_bizlists_path(current_user)
      flash[:biz_delete] = "Bizlist deleted"
    else
      render :show
      flash[:biz_error] = "This bizlist could not be deleted"
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
    unless !!@bizlist && (@bizlist.user_id == current_user.id)
      flash[:warning] = "No bizlist noted"
      redirect_to bizlists_path
    end
  end
end
