class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.create(make: params[:car][:make], model: params[:car][:model], year: params[:car][:year], engine: params[:car][:engine], turbocharged: params[:car][:turbocharged])
    redirect_to cars_path
  end

  def index
    @cars = Car.all
  end
end
