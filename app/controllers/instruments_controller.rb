class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.where(band_id: params[:band_id])
  end

  def new
    @instrument = Instrument.new
    @choices = ['Acoustic Guitar', 'Electric Guitar', 'Bass', 'Drums', 'Slide Guitar', 'Banjo', 'Mandolin', 'Dobro', 'Fiddle']
  end

  def create
    instrument = Instrument.new(allowed_parameters.merge(band_id: params[:band_id]))
    if instrument.save
      redirect_to band_instruments_path
    else
      @instrument = instrument
      render :new
    end
  end

  private

  def allowed_parameters
    params.require(:instrument).permit(:kind, :manufacturer, :model, :year, :color)
  end
end
