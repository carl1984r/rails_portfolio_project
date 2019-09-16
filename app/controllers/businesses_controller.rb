class BusinessesController < ApplicationController
  before_action :require_login
  before_action :init_username
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
  end

  private

  def business_params
    params.require(:business).permit( :name, :address, :description )
  end

  def init_username
    @username = current_user.username
  end

  def init_business
    @business= Business.find_by(id: params[:id])
  end

end
