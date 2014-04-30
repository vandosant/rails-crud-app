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
      redirect_to '/colors', notice: "Color successfully added"
    else
      render :new
    end
  end

  def show
    @color = Color.find(params[:id])
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    @color = Color.find(params[:id])
    @color.update(:name => params[:name], :primary => params[:primary], :spectrum => params[:spectrum])

    if @color.save
      redirect_to '/colors', notice: "Color successfully updated"
    else
      render :edit
    end
  end
end