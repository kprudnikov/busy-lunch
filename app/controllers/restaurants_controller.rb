class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    puts "new rest page"
  end

  def create
    @restaurant = Restaurant.find_or_create_by(restaurant_params)

    render json: @restaurant

#     respond_with @restaurant, json: @restaurant

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