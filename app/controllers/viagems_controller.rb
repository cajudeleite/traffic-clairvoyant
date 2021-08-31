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
  end

  def maps_api
    @params = viagem_params

  end

  private

  def viagem_params
    params.require(:viagem).permit(:origem, :destino)
  end
end
