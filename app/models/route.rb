class Route < ApplicationRecord
  belongs_to :road
  belongs_to :origin_destination_route
end
