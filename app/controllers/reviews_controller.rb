class ReviewsController < ApplicationController

  def create
    @review = Review.create(params[:review].permit(:restaurant_id, :comment, :rating))
    @restaurant = Restaurant.find(params[:review][:restaurant_id])
    redirect_to @restaurant
  end

end
