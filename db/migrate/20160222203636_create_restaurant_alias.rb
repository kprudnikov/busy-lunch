class CreateRestaurantAlias < ActiveRecord::Migration
  def change
    create_table :restaurant_aliases do |t|
      t.references :restaurant
      t.string :name
    end
  end
end
