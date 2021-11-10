class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(restaurants).permit(:name, :address, :phone_numeber, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
