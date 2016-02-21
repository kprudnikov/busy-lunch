class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :comment, null: false, default: ""
      t.decimal :price
      t.integer :serve_time, null: false, default: 0
      t.references :restaurant, index: true, foreign_key: true
      t.integer :meals_number

      t.timestamps null: false
    end
  end
end
