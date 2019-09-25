class ReviewsController < ApplicationController
  before_action :require_login
  before_action :init_business
  before_action :init_username

  def new
    @review = Review.new
    @business = Business.find_by(id: params[:business_id])
  end

  def create
    if !!params[:review] && !!params[:review][:experience] && !!params[:review][:location] && !!params[:review][:value]
      @review = Review.new(review_params)
      @review.user = @username
      @business.reviews << @review
      flash[:review_created] = "Review successfully created"
      redirect_to business_path(@business)
    else
      flash[:review_error] = "Review form must be completed. Comments are optional."
      redirect_to new_business_review_path(@business)
    end
  end

  private

  def review_params
    params.require(:review).permit( :experience, :location, :value, :comment )
  end

  def init_business
    @business = Business.find_by(id: params[:business_id])
  end

  def init_username
    @username = current_user.username
  end

end
