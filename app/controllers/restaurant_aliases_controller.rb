class RestaurantAliasesController < ApplicationController
  def create

  end

private

  def alias_params
    params.require(:restaurant_alias).permit(:id, :name, :restaurant_id)
  end
end
