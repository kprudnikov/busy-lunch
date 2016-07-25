class RestaurantAlias < ActiveRecord::Base
  belongs_to :restaurant

  def find_or_create_restaurant(name)
    restaurant_alias = self.find(name: name)
    if restaurant_alias
      @restaurant = restaurant_alias
    end
  end
end
