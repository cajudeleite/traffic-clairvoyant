class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @trip = Trip.new()
  end

  def new
    @trip = Trip.new()
    raise
  end

  def update
    @trip = Trip.find(params[:id])
    original_time = @trip.time
    new_time = params[:trip]["time"].to_f
    @trip.origin_destination_routes.routes.each do |route|

      road_original_time = original_time.to_i + (route.step.to_i - 1)
      road_new_time = new_time.to_i + (route.step.to_i - 1)

      road_car = RoadCar.where("road_id = #{route.road.id} and time = #{road_original_time}").first
      road_car.number_of_cars -= 1
      road_car.save

      new_road_car = RoadCar.where("road_id = #{route.road.id} and time = #{road_new_time}").first
      new_road_car.number_of_cars += 1
      new_road_car.save
    end
    # raise
    @trip.time = params[:trip]["time"].to_f
    # raise
    actual_duration = params[:trip]['actual_duration(4i)'].to_i*60 + params[:trip]['actual_duration(5i)'].to_i
    @trip.actual_duration = actual_duration
    @trip.save
    redirect_to my_trips_path, notice: "trip succesfully updated!"
  end

  def create
    @year = params[:trip]["date(1i)"]
    @month = params[:trip]["date(2i)"]
    @day = params[:trip]["date(3i)"]
    @odr = OriginDestinationRoute.find(params[:trip]["origin_destination_routes"])
    date = DateTime.new(@year.to_i, @month.to_i, @day.to_i).to_date
    if Trip.where("user_id = #{current_user.id} and date = '#{date}'").count > 0
      flash[:notice] = 'You already have a planned trip for this date.'
      redirect_to my_trips_path and return
    end
    trip = Trip.new(trip_params)
    trip.origin_destination_routes = @odr
    trip.date = date
    trip.user = current_user
    if trip.save
      #Salvar a viagem de carro
      @odr.routes.each do |route|
        time = params[:trip]['time'].to_i + (route.step.to_i - 1)
        road_car = RoadCar.where("road_id = #{route.road.id} and time = '#{time}'").first
        road_car.number_of_cars += 1
        road_car.save
      end
      redirect_to my_trips_path
    else
      # flash.now[:alert] = 'Failed!'
      # redirect_to trips_info_path(:params[:trip])
    end
  end

  def info
    # raise
    if params[:new_trip].nil?
      redirect_to trips_path, alert: 'invalid parameters. Please fill all fields'
    else
      @origin = params[:new_trip][:origin]
      @destination = params[:new_trip][:destination]
      # @year = params[:new_trip]["day(1i)"]
      # @month = params[:new_trip]["day(2i)"]
      # @day = params[:new_trip]["day(3i)"]
      @date = params[:new_trip]['day']
      # raise
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
      @trip.date = @date
    end
  end

  def show
    @trip = Trip.find(params[:id])
    # raise
    if @trip.user != current_user
      redirect_to my_trips_path, alert: 'you don\'t have permission'
    end

    @origin = @trip.origin_destination_routes.origin
    @destination = @trip.origin_destination_routes.destination
    @year = @trip.date.year
    @month = @trip.date.month
    @day = @trip.date.day
    horarios = %w[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24]
    roads_hash = {}
    @odr = @trip.origin_destination_routes

    @trip.origin_destination_routes.roads.each do |road|
      step = @trip.origin_destination_routes.routes.where("road_id = #{road.id}").first.step
      cars = road.road_cars.where("time = #{@trip.time + (step - 1)}").first.number_of_cars
      roads_hash[road.name] = cars
    end
    @graph_data = roads_hash
    gon.time = @trip.time.to_i
    gon.graph_data = @graph_data
    # raise
  end

  def mytrips
    @trips = Trip.all.where("user_id = #{current_user.id}")
  end


  def destroy
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect_to my_trips_path, alert: 'trip cancelled!'
  end

  def review
    @trip = Trip.find(params[:id])
  end


  def sankey
    @graph_data = []
    OriginDestinationRoute.all.each do |odr|
      i = 1
      weight = Trip.all.where("origin_destination_routes_id = #{odr.id}").count
      until (odr.routes.where("step = #{i}")).empty?
        step1 = odr.routes.where("step = #{i}").first.road.name
        if (odr.routes.where("step = #{i+1}")).empty?
          step2 = 'Ubatuba'
        else
          step2 = odr.routes.where("step = #{i + 1}").first.road.name
        end
        array = [step1, step2, weight]
        @graph_data << array
        i += 1
      end
    end
    gon.graph_data = @graph_data
    # raise
  end

  private

  def trip_params
    params.require(:trip).permit(:time, "date(1i)", "date(2i)", "date(3i)")
  end
end
