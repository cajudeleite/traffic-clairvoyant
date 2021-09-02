require "uri"
require "net/http"

class ViagemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @viagems = Viagem.all.where("user_id = #{current_user.id}")
    redirect_to 'viagems/new' if @viagems
  end

  def new
    @viagem = Viagem.new
  end

  def create
    @viagem = Viagem.new(viagem_params)
    @viagem.user_id = current_user.id
    @viagem.save!
    redirect_to viagem_path(@viagem)
  end

  def edit

  end

  def update

  end

  def show
    @viagem = Viagem.find(params[:id])
    @params = viagem_params
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyA4pZlhCteWdP_CS0zgmUG8YuFsxPsm9bk'
    response = URI.open(url)
    @json_response = JSON.parse(response)
  end

  def maps_api

    # @origem = Google::Maps.geocode("Sao Paulo").first
    # @destino = Google::Maps.geocode("Ubatuba").first
    # route = Google::Maps.route("#{@origem.latitude}, #{@origem.longitude}", "#{@destino.latitude}, #{@destino.longitude}")
    # steps = []
    # route.steps.each do |step|
    #   steps << step if step.distance.value > 10000
    # end

    # #ESTRADA
    # url = URI("https://roads.googleapis.com/v1/nearestRoads?points=-23.3862104,-46.15781260000001&key=#{ENV['MAPS_API_KEY']}")
    # https = Net::HTTP.new(url.host, url.port)
    # https.use_ssl = true
    # request = Net::HTTP::Get.new(url)
    # response = https.request(request)


    # # REVERSE GEOCODE

    # reverse_geocode_responses = []
    # reverse_geocode_routes = []
    # steps.each do |step|
    #   url = URI("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{step.end_location.lat},#{step.end_location.lng}&key=#{ENV['MAPS_API_KEY']}")
    #   https = Net::HTTP.new(url.host, url.port)
    #   https.use_ssl = true
    #   request = Net::HTTP::Get.new(url)
    #   response = https.request(request)
    #   json_response = JSON.parse(response.body)
    #   reverse_geocode_responses << json_response

    #   reverse_geocode_responses.each do |response|
    #     response["results"].each do |result|
    #       result["address_components"].each do |component|
    #         reverse_geocode_routes << component if component["types"].include? 'route'
    #       end
    #     end
    #   end
    # end
    # raise

  end

  private

  def viagem_params
    params.require(:viagem).permit(:origem, :destino)
  end
end
