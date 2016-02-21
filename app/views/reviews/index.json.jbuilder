json.array!(@reviews) do |review|
  json.extract! review, :id, :rate, :comment, :price, :serve_time, :restaurant_id, :meals_number
  json.url review_url(review, format: :json)
end
