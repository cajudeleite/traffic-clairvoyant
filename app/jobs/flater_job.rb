class FlaterJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Calling Clearbit API for #{user.email}..."
    sleep 3
    puts "Done! Enriched #{user.email} with Clearbit"
    user.trips.each do |trip|
      hour = trip.time
      trip.origin_destination_routes.roads.each do |road|
        road.road_cars.each do |element|
          if element.time == (hour - 1)
            p element.time
            @bef = element
            p @bef
          end
          if element.time == hour
            p element.time
            @real = element
            p @real
          end
          if element.time == (hour + 1)
            p element.time
            @aft = element
            p @aft
          end
        end
        p 'this is a separation'
        p @bef
        p @real
        p @aft
        p 'this is another separation'
        if (@real.number_of_cars > @aft.number_of_cars || @real.number_of_cars > @bef.number_of_cars)
          p 'there is a faster way'
        else
          p 'nope my dude'
        end
      end
    end
    puts 'foi'
  end
end
