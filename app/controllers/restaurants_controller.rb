class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order(:name)
  end

  def show
    @restaurant = Restaurant.find_by!(slug: params[:id])
    @menu_items = @restaurant.menu_items.where(available: true).order(:name)
  end
end
