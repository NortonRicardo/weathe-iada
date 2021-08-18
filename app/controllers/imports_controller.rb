class ImportsController < ApplicationController
  before_action :set_import, only: %i[ show edit update destroy ]

  # GET /imports or /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1 or /imports/1.json
  def show
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports or /imports.json
  def create
    if params[:import][:data].present?
      @data = []
      params[:import][:data].each do |file|
        File.open(file.tempfile.path).each_with_index do |linha_atual, linha|
          if linha == 0
          end
        end
      end
    end
    # t.time :hora_inicio_programada, null: false, comment: 'Hora do início da entrevista'
    #
    # rails generate scaffold WeatherData data:date, hora:time, prec_total_horario:float, pres_atmos_nivel_estacao:float, pres_atmos_max:float, pres_atmos_min:float, radiacao_global:float, temp_ar_bulso_seco:float, temp_ponto_orvalho:float, temp_min_hora_ant:float, temp_monima_hora_ant:float, temp_orvalho_max_hora_ant:float, temp_orvalho_min_hora_ant:float, umid_rel_max_hora_ant:float, umid_rel_min_hora_ant:float, umid_relativa_ar:float, vento_direcao_horario:float, vento_rajada_maxima:float, vento_velocidade_horario:float


    # respond_to do |format|
    #   if @import.save
    #     format.html { redirect_to @import, notice: "Import was successfully created." }
    #     format.json { render :show, status: :created, location: @import }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @import.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /imports/1 or /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: "Import was successfully updated." }
        format.json { render :show, status: :ok, location: @import }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1 or /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: "Import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_params
      params.fetch(:import, {})
    end
end
