class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
  end

  def create
    band = Band.new
    band.name = params[:name]
    band.genre = params[:genre]
    band.members = params[:members]
    band.save
    redirect_to '/bands'
  end
end