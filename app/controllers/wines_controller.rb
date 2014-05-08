class WinesController < ApplicationController
  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    wine = Wine.new
    wine.name = params[:wine][:name]
    wine.style = params[:wine][:style]
    wine.color = params[:wine][:color]
    wine.rating = params[:wine][:rating]
    wine.save
    redirect_to :wines
  end
end