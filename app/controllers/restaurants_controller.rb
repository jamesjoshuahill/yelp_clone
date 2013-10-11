class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params[:restaurant].permit(:name, :description))
    redirect_to @restaurant
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params[:restaurant].permit(:name, :description))
    redirect_to @restaurant
  end

end
