class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.last
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:review][:restaurant_id])
    @review = Review.create(params[:review].permit(:restaurant_id, :comment, :rating))
    redirect_to @restaurant
  end

end
