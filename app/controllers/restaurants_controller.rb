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

    # if @restaurant.save
    #   flash[:success] = 'Отличненько, ресторан добавлен.'
    #   redirect_to new_restaurant_review_path(@restaurant)
    # else
    #   flash[:danger] = 'Ну вы же не на улице едите, в самом деле? У заведения наверняка есть название.'
    #   redirect_to new_restaurant_path
    # end
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