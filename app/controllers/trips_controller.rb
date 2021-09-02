class TripsController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    @trip = Trip.new()
  end

  def new
    @trip = Trip.new()
    raise
  end

  def create
    @year = params[:trip]["date(1i)"]
    @month = params[:trip]["date(2i)"]
    @day = params[:trip]["date(3i)"]
    @odr = OriginDestinationRoute.find(params[:trip]["origin_destination_routes"])
    date = DateTime.new(@year.to_i, @month.to_i, @day.to_i).to_date
    trip = Trip.new(trip_params)
    trip.origin_destination_routes = @odr
    trip.date = date
    trip.user = current_user
    if trip.save
      redirect_to trips_path
    else

    end
  end

  def info
    # raise
    @origin = params[:new_trip][:origin]
    @destination = params[:new_trip][:destination]
    @year = params[:new_trip]["day(1i)"]
    @month = params[:new_trip]["day(2i)"]
    @day = params[:new_trip]["day(3i)"]
    horarios = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]
    roads_hash = {}
    @origin_destination_routes = OriginDestinationRoute.where("origin_id = #{@origin} and destination_id = #{@destination}")
    Road.all.each do |road|
      horario_hash = {}
      horarios.each do |horario|
        road_cars = RoadCar.where("time = '#{horario}' and road_id = #{road.id}").first
        horario_hash[horario] = road_cars.number_of_cars
      end
      roads_hash[road.name] = horario_hash
    end
    @graph_data = roads_hash
    gon.graph_data = @graph_data
    # raise

    @trip = Trip.new()
    @trip.date = DateTime.new(@year.to_i, @month.to_i, @day.to_i).to_date
  end

  def show
  end

  private

  def trip_params
    params.require(:trip).permit(:time, "date(1i)", "date(2i)", "date(3i)")
  end
end
