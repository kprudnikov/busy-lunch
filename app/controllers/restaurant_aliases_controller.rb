class RestaurantAliasesController < ApplicationController
  def create

  end

  def find
    # puts params[name]
    # @names = RestaurantAlias.find(:all, :conditions => :name.match(params[:name]))
    @names = RestaurantAlias.find(:all, :conditions => ['name like ' + params[:name]])


    render :json => @names.to_json
    # puts params
  end

private

  def alias_params
    params.require(:restaurant_alias).permit(:id, :name, :restaurant_id)
  end
end
