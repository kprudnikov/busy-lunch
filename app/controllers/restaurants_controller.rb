class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      flash[:success] = 'Successfully created'
    else
      flash[:error] = 'Couldn\'t create'
    end

    redirect_to restaurants_path
  end

  def update

  end

  def delete

  end

private

  def restaurant_params
    params.require(:restaurant).permit(:id, :name)
  end

end