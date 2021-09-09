# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars' }, { name: 'Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




## SEEDS > VIAGENS PARA UBATUBA

## Estradas
puts "seeding roads..."
roads = %w[SP070 SP125 SP099 BR101 SP065 BR116]
directions = %w[C P]
roads.each do |road|
  directions.each do |direction|
    new_road = Road.new(name:road, direction: direction)
    new_road.save!
  end
end

## Origens
puts "seeding origins..."
origins = { 'Sao Paulo' => 24, 'Suzano' => 1, 'Sao Jose dos Campos' => 2, 'Campinas' => 7, 'Taubate' => 1 }
origins.each do |origin, weight|
  new_origin = Origin.new(name: origin)
  new_origin.weight = weight
  new_origin.save!
end

## Destinos
puts "seeding destinations..."
destinations = ['Ubatuba', 'Santos', 'Caraguatatuba', 'Paraty']
destinations.each do |destination|
  new_destination = Destination.new(name: destination)
  new_destination.save!
end

## origin_destination_routes

puts "seeding routes"
# SP - Ubatuba
puts "1"
origin = Origin.where("name = 'Sao Paulo'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP070 + SP125"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

puts "2"
## ROTAS
road = Road.where("name = 'SP070' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

puts "3"
road = Road.where("name = 'SP125' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!

puts "4"
origin = Origin.where("name = 'Sao Paulo'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP070 + SP099 + BR101"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'SP070' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'SP099' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!

road = Road.where("name = 'BR101' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 3, duration: 60)
rota.save!


origin = Origin.where("name = 'Sao Paulo'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "BR116 + SP125"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'BR116' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'SP125' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!


# Suzano - Ubatuba
origin = Origin.where("name = 'Suzano'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP070 + SP125"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'SP070' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'SP125' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!




puts "6"
origin = Origin.where("name = 'Suzano'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP070 + SP099 + BR101"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!


## ROTAS
road = Road.where("name = 'SP099' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'BR101' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!


puts "6"
# Sao Jose dos Campos - Ubatuba
origin = Origin.where("name = 'Sao Jose dos Campos'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "BR116 + SP125"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'BR116' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'SP125' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!


puts "7"
origin = Origin.where("name = 'Sao Jose dos Campos'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP099 + BR101"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'SP099' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!

road = Road.where("name = 'BR101' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 2, duration: 60)
rota.save!


puts "8"
# Taubate - 'Ubatuba'
origin = Origin.where("name = 'Taubate'").first
destination = Destination.where("name = 'Ubatuba'").first
name = "SP125"
new_origin_destination_route = OriginDestinationRoute.new(origin_id: origin.id, destination_id: destination.id, name: name)
new_origin_destination_route.save!

## ROTAS
road = Road.where("name = 'SP125' and direction = 'P'").first
rota = Route.new(origin_destination_route_id: new_origin_destination_route.id, road: road, step: 1, duration: 60)
rota.save!


# USER
puts 'user....'
user = User.new(email: 'a@a.com' )
user.password = '123456'
user.encrypted_password = '123456'
user.save!


# VIAGENS
puts 'viagens...'
horarios = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23]
i = 0
500.times do
  trip = Trip.new()
  trip.origin_destination_routes_id = OriginDestinationRoute.all.sample.id
  trip.time = horarios.sample
  trip.date = DateTime.current.to_date
  trip.user = User.first
  # puts trip.origin_destination_routes_id
  trip.save!
end

day = DateTime.current.to_date
roads_hash = {}
horarios = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23]

puts 'cars'
Road.all.each do |road|
  horarios.each do |horario|
    road_car = RoadCar.new
    road_car.day = day
    road_car.time = horario.to_f
    road_car.road = road
    road_car.number_of_cars = 0
    trips_horario = Trip.all.where("time = #{horario} and date = '#{day}'")
    trips_horario.each do |trip|
      trip.origin_destination_routes.routes.where("road_id = #{road.id}").each do |route|
        road_car.number_of_cars += (1 * trip.origin_destination_routes.origin.weight)
      end
    end
  road_car.save!
  puts road_car.id
  end

end

## SEED DO GUI
#origem = ['R. Inhambu, 240 - Vila Uberabinha, São Paulo - SP, 04520-010'],['Rua Djalma Forjaz, 93 - 10 - Capivari, Campos do Jordão - SP, 12460-000'],['Rua Jericó 193 - cj. 72 - Vila Madalena, São Paulo - SP, 05435-040'],['Av. Brg. Faria Lima, 2170 - Putim, São José dos Campos - SP, 12227-901'],['Av. Dona Ana Costa, 465 - Gonzaga, Santos - SP, 11060-003']
#
#user = User.new
#user = User.new(email: "a@a.com")
#  user.password = '123456'
#  user.encrypted_password = '123456'
#user.save
#
#destino = ['R. Salvador Correa, 365 - Centro, Ubatuba - SP, 11680-000']
#origem.each do |origem|
#
# viagem = Viagem.new(
#    origem: origem,
#    destino: destino
#  )
#  viagem.user = user
#  viagem.save!
#end
#
#
#puts 'Finished!'
