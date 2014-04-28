class ColorsController < ApplicationController
  def index
    @colors = Color.all
  end

  def new
    @color = Color.new
  end

  def create
    @color = Color.new
    @color.name = params[:name]
    @color.primary = params[:primary]
    @color.spectrum = params[:spectrum]

    if @color.save
      redirect_to '/colors'
    else
      render :new
    end
  end
end