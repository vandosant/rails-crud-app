class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
  end

  def create
    color = Color.new
    color.name = params[:name]
    color.primary = params[:primary]
    color.spectrum = params[:spectrum]
    color.save
    redirect_to '/colors'
  end
end