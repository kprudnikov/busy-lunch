class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :restaurant_aliases, dependent: :destroy

  validates_presence_of :name
end
