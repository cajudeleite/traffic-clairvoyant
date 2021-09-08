class FlaterJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    user.trips.each do |trip|
      hour = trip.time
      trip.origin_destination_routes.roads.each do |road|
        road.road_cars.each do |element|
          if element.time == (hour - 1)
            @bef = element
          end
          if element.time == hour
            @real = element
          end
          if element.time == (hour + 1)
            @aft = element
          end
        end
      end
      if (@real.number_of_cars > @aft.number_of_cars || @real.number_of_cars > @bef.number_of_cars)
        NewComment.with(message: "There is a faster schedule for your trip from #{trip.origin_destination_routes.origin.name} to #{trip.origin_destination_routes.destination.name}", link: "Check it out").deliver(user)
      end
    end
  end
end
