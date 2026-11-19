module Admin
  class RestaurantsController <  BaseController
    def index
      @restaurants = Restaurant.order(:name)
    end

    def show
      @restaurant = Restaurant.find_by!(slug: params[:id])
      @menu_items = @restaurant.menu_items.order(:name)
    end
  end
end