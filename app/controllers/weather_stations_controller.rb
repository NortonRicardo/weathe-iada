class WeatherStationsController < ApplicationController
  before_action :set_weather_station, only: %i[ show edit update destroy ]

  def index
    @weather_stations = WeatherStation.all.paginate(page: params[:page], per_page: 10)
    @weather_stations_search = WeatherStation.new()
    @region = WeatherStation.all.collect{ |t| [t.region,t.region_to_s]}.uniq
    @estado = WeatherStation.all.collect{ |t| t.state }.uniq
    @cidade = WeatherStation.all.collect{ |t| t.station }.uniq
    @wmo = WeatherStation.all.collect{ |t| t.wmo_code }.uniq
  end

  def show
  end

  def new
    @weather_station = WeatherStation.new
  end

  def edit
  end

  def create
    @weather_station = WeatherStation.new(weather_station_params)

    respond_to do |format|
      if @weather_station.save
        format.html { redirect_to @weather_station, notice: "Weather station was successfully created." }
        format.json { render :show, status: :created, location: @weather_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weather_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @weather_station.update(weather_station_params)
        format.html { redirect_to @weather_station, notice: "Weather station was successfully updated." }
        format.json { render :show, status: :ok, location: @weather_station }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weather_station.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @weather_station.destroy
    respond_to do |format|
      format.html { redirect_to weather_stations_url, notice: "Weather station was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_weather_station
      @weather_station = WeatherStation.find(params[:id])
    end

    def weather_station_params
      params.require(:weather_station).permit(:region, :state, :station, :wmo_code, :latitude, :longitude, :altitude, :foundation)
    end
end
