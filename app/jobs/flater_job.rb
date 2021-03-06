class FlaterJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    if user_id != 1
      user = User.find(user_id)
      user.trips.where('date >= ?', Date.today).each do |trip|
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
        if ((@aft && @real.number_of_cars > @aft.number_of_cars) || (@bef && @real.number_of_cars > @bef.number_of_cars))
          NewComment.with(message: "There is a faster schedule for your trip from #{trip.origin_destination_routes.origin.name} to #{trip.origin_destination_routes.destination.name} at the departure time of #{trip.time} UTC-3", link: "Check it out", url: "trips/#{trip.id}").deliver(user)
        end
      end
    end
  end
end
