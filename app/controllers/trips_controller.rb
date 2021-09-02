class TripsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @trip = Trip.new()
  end

  def new
    @trip = Trip.new()
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
  end

  def show
  end
end
