# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.find_or_create_by!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

loft = Restaurant.find_or_create_by!(name: "Лофт гастропаб")
strasse = Restaurant.find_or_create_by!(name: "Штрассе паб")

RestaurantAlias.find_or_create_by!({name: "Loft", restaurant_id: loft.id})
RestaurantAlias.find_or_create_by!({name: "Loft gastropub", restaurant_id: loft.id})
RestaurantAlias.find_or_create_by!({name: "Лофт", restaurant_id: loft.id})
RestaurantAlias.find_or_create_by!({name: "Лофт гастропаб", restaurant_id: loft.id})

RestaurantAlias.find_or_create_by!({name: "Штрассе", restaurant_id: strasse.id})
RestaurantAlias.find_or_create_by!({name: "Штрассе паб", restaurant_id: strasse.id})
RestaurantAlias.find_or_create_by!({name: "Strasse", restaurant_id: strasse.id})
RestaurantAlias.find_or_create_by!({name: "Strasse pub", restaurant_id: strasse.id})