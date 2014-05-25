class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    car = Car.new(allowed_parameters)
    if car.save
      redirect_to cars_path
    else
      @car = car
      render :new
    end
  end

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  private

  def allowed_parameters
    params.require(:car).permit(:model, :make, :year, :engine, :turbocharged)
  end
end
