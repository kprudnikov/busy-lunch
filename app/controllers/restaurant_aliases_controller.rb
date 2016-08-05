class RestaurantAliasesController < BaseController
  def create

  end

  def find
    name = params[:name];
    aliases = RestaurantAlias.where('name Like ? ', "%#{name}%")
    uniq_aliases = aliases.to_a.uniq{|a| a[:restaurant_id]}

    restaurants = uniq_aliases.map{|a| Restaurant.find(a.restaurant_id)}
    respond_with restaurants, json: restaurants
  end

private

  def alias_params
    params.require(:restaurant_alias).permit(:id, :name, :restaurant_id)
  end
end
