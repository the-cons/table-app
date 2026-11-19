class MenuItemsController < ApplicationController
  before_action :set_restaurant

  def new
    @menu_item = @restaurant.menu_items.build
  end

  def create
    @menu_item = @restaurant.menu_items.build(menu_item_params)

    if @menu_item.save
      redirect_to @restaurant, notice: "#{@menu_item.name} was added to the menu."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by!(slug: params[:restaurant_id])
  end

  def menu_item_params
    params.expect(menu_item: [ :name, :description, :price, :available ])
  end
end
