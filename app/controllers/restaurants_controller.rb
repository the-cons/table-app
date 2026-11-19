class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.includes(:menu_items).order(:name)
  end

  def show
    @restaurant = Restaurant.find_by!(slug: params[:id])
    @menu_items = @restaurant.menu_items.available.order(:name).load
  end
end
