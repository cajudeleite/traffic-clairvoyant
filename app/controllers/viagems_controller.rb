class ViagemsController < ApplicationController

  def index
    @viagens = Viagem.all.where("user_id = #{current_user.id}")
  end

  def new
  end

  def create

  end

  def edit

  end

  def update

  end
end
