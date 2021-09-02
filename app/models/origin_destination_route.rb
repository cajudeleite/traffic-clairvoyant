class OriginDestinationRoute < ApplicationRecord
  belongs_to :origin
  belongs_to :destination
  has_many :trips
  has_many :routes
  has_many :roads, through: :routes


  # def routes
  #   Route.all.where("origin_destination_route_id = #{self.id}")
  # end
end
