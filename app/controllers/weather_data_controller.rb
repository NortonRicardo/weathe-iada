class WeatherDataController < ApplicationController
  before_action :set_weather_datum, only: %i[ show edit update destroy ]

  # GET /weather_data or /weather_data.json
  def index
    @weather_data = WeatherDatum.all
  end

  # GET /weather_data/1 or /weather_data/1.json
  def show
  end

  # GET /weather_data/new
  def new
    @weather_datum = WeatherDatum.new
  end

  # GET /weather_data/1/edit
  def edit
  end

  # POST /weather_data or /weather_data.json
  def create
    @weather_datum = WeatherDatum.new(weather_datum_params)

    respond_to do |format|
      if @weather_datum.save
        format.html { redirect_to @weather_datum, notice: "Weather datum was successfully created." }
        format.json { render :show, status: :created, location: @weather_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weather_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_data/1 or /weather_data/1.json
  def update
    respond_to do |format|
      if @weather_datum.update(weather_datum_params)
        format.html { redirect_to @weather_datum, notice: "Weather datum was successfully updated." }
        format.json { render :show, status: :ok, location: @weather_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weather_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_data/1 or /weather_data/1.json
  def destroy
    @weather_datum.destroy
    respond_to do |format|
      format.html { redirect_to weather_data_url, notice: "Weather datum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_datum
      @weather_datum = WeatherDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weather_datum_params
      params.require(:weather_datum).permit(:data, :hora, :prec_total_horario, :pres_atmos_nivel_estacao, :pres_atmos_max, :pres_atmos_min, :radiacao_global, :temp_ar_bulso_seco, :temp_ponto_orvalho, :temp_min_hora_ant, :temp_monima_hora_ant, :temp_orvalho_max_hora_ant, :temp_orvalho_min_hora_ant, :umid_rel_max_hora_ant, :umid_rel_min_hora_ant, :umid_relativa_ar, :vento_direcao_horario, :vento_rajada_maxima, :vento_velocidade_horario)
    end
end
