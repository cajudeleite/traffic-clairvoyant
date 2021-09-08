class Road < ApplicationRecord
  has_many :routes
  has_many :road_cars
end
