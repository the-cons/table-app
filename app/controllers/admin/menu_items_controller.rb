module Admin
  class MenuItemsController < BaseController
    before_action :set_restaurant
    before_action :set_menu_item, only: [ :edit, :update, :destroy ]

    def new
      @menu_item = @restaurant.menu_items.build
    end

    def create
      @menu_item = @restaurant.menu_items.build(menu_item_params)

      if @menu_item.save
        redirect_to @restaurant, notice: "#{@menu_item.name} was added to the menu."
      else
        render :new, status: :unprocessable_content
      end
    end

    def edit
    end

    def update
      if @menu_item.update(menu_item_params)
        redirect_to [:admin, @restaurant], notice: "#{@menu_item.name} was updated successfully."
      else
        render :edit, status: :unprocessable_content
      end
    end

    def destroy
      @menu_item.destroy
      redirect_to [:admin, @restaurant], notice: "#{@menu_item.name} was deleted successfully.", status: :see_other
    end

    private

    def set_restaurant
      @restaurant = Restaurant.find_by!(slug: params[:restaurant_id])
    end

    def menu_item_params
      params.expect(menu_item: [ :name, :description, :price, :available ])
    end

    def set_menu_item
      @menu_item = @restaurant.menu_items.find(params[:id])
    end
  end
end
