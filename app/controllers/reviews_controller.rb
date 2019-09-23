class ReviewsController < ApplicationController
  before_action :require_login
  before_action :init_business

  def new
    @review = Review.new
    @business = Business.find_by(id: params[:business_id])
  end

  def create
    @review = Review.new(review_params)
    if @business.reviews << @review
      flash[:review_created] = "Review successfully created"
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit( :experience, :location, :value )
  end

  def init_business
    @business = Business.find_by(id: params[:business_id])
  end

end
