class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @business = Business.find_by(id: params[:business_id])
  end

end
