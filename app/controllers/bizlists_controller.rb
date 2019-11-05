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

  def remove
    @bizlist = Bizlist.find_by(id: params[:bizlist_id])
    if !@bizlist.businesses.any?
      redirect_to bizlist_path(@bizlist)
      flash[:biz_not_present] = "No biz to remove from this bizlist"
    end
  end

  def create
    @bizlist = @user.bizlists.build(bizlist_params)
    if @bizlist.save
      flash[:message] = "Bizlist Successfully Created"
      redirect_to user_bizlists_path(current_user)
    else
      flash[:name_required] = "Bizlist name required"
      redirect_to new_user_bizlist_path(current_user)
    end
  end

  def update
    if Bizlist.verify_presence(@bizlist, params[:bizlist]['add_to'])
         @bizlist.businesses << Business.find_by(id: params[:bizlist]['add_to'])
         redirect_to bizlist_path(@bizlist)
         flash[:biz_added] = "Biz successfully added to this bizlist"
    elsif !!@bizlist.businesses.find_by(id: params[:bizlist]['add_to'])
         redirect_to bizlist_path(@bizlist)
         flash[:biz_present] = "Biz already added to this bizlist"
    elsif !!params[:bizlist]['remove_from']
         @bizlist.remove_biz(@bizlist, params[:bizlist]['remove_from'])
         redirect_to bizlist_path(@bizlist)
         flash[:biz_removed] = "Biz removed from this bizlist"
    else
         @bizlist.update(bizlist_params)
           if @bizlist.save
             redirect_to bizlist_path(@bizlist)
             flash[:biz_updated] = "Bizlist updated"
           else
             flash[:name_required] = "Bizlist name required"
             redirect_to edit_user_bizlist_path(current_user, @bizlist)
           end
    end
 end

 def favs
   @bizlists = current_user.bizlists
   @businesses = Business.user_favs(current_user.id)
   if @businesses.empty?
     flash[:no_fav_search_results] = "No businesses marked as favorite"
   else
     flash[:fav_biz] = "Business favorites"
   end
   render :index
 end

 def search
    @bizlists = current_user.bizlists
    @businesses = Business.search(params[:query])
    if @businesses.empty?
      flash[:no_search_results] = "No business found"
    end
    render :index
 end

 def last_day
   @bizlists = current_user.bizlists
   @businesses = Business.last_day
   if @businesses.empty?
     flash[:no_search_results] = "No business found"
   end
   render :index
 end

 def list_destroy
   @bizlist = Bizlist.find_by(id: params[:bizlist])
    if !!@bizlist
      @bizlist.delete_bizlist(@bizlist)
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
      redirect_to bizlists_path
    end
  end
end
