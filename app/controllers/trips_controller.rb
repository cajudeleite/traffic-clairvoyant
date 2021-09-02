class TripsController < ApplicationController
  skip_before_action :authenticate_user!

  def index

  end

  def new
    @trip = Trip.new()
  end

  def create

  end


  def show

    # ## pegar uma origin_destination_route aletória
    # trip_route = OriginDestinationRoute.all.sample
    # ## pegar as estradas utilizadas
    # roads = []
    # trip_route.routes.each do |route|
    #   roads << route.road
    # end
    # ## pegar o dia
    # day = DateTime.current.to_date
    # ## para cada horário, pegar todas viagens utilizando essas estradas
    # ## somar count para cada estrada

    # horarios_hash = {}
    # horarios.each do |horario|

    #   trips_horario = Trip.all.where("time = #{horario}")
    #   roads_horario = {}

    #   trips_horario.each do |trip|
    #     trip.origin_destination_routes.routes.each do |route|
    #       roads_horario[route.road.name] = roads_horario[route.road.name] ? roads_horario[route.road.name] + 1 : 1
    #     end
    #   end
    #   horarios_hash[horario] = roads_horario
    # end

    ## montar gráfico
horarios = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]
    roads_hash = {}
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

end
