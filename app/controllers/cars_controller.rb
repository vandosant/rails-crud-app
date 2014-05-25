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

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    if car.update(allowed_parameters)
      redirect_to cars_path
    else
      @car = car
      render :edit
    end
  end

  private

  def allowed_parameters
    params.require(:car).permit(:model, :make, :year, :engine, :turbocharged)
  end
end
