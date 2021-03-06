class BusinessesController < ApplicationController
  before_action :require_login
  before_action :init_username
  before_action :init_user
  before_action :init_business

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      flash[:business] = "Business successfully added"
      redirect_to user_bizlists_path(current_user)
    else
      render :new
    end
  end

  def update
   @business.update(business_params)
   if @business.save
     redirect_to business_path(@business)
     flash[:business_updated] = "Business updated"
   else
     render :edit
   end
 end

  def show
    @business = Business.find_by(id: params[:id])
    if !@business
      redirect_to user_bizlists_path(current_user)
    end
  end
#
  def fav
    @business = Business.find_by(id: params[:format])
    if !@business.review_find(@user).empty?
       @business.find_and_update_join(@user)
       redirect_to business_path(@business)
         if @business.find_join_attribute(@user)
          flash[:business_marked_as_favorite] = "Business marked as fav"
         else
          flash[:business_unmarked_as_favorite] = "Business unmarked as fav"
         end
    else
      redirect_to business_path(@business)
      flash[:business_needs_review] = "Must review business before marking as fav"
    end
  end

  def most_ratings
    @business = Business.most_ratings
    flash[:most_business_ratings] = "Business with most ratings"
    render :show
  end

  private

  def business_params
    params.require(:business).permit( :name, :address, :description, :bizlist_id )
  end

  def init_username
    @username = current_user.username
  end

  def init_user
    @user = current_user
  end

  def init_business
    @business = Business.find_by(id: params[:id])
  end

end
