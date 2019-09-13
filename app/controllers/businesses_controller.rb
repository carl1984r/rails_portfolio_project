class BusinessesController < ApplicationController
  before_action :require_login

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

  def show
    @business = Business.find_by(id: params[:id])
  end

  private

  def business_params
    params.require(:business).permit( :name, :address, :description )
  end

end
