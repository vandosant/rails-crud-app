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

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.update_attributes(:name => params[:name], :genre => params[:genre], :members => params[:members])
    redirect_to '/bands'
  end
end