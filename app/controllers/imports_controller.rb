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

  def upload_info_view
    @cdg_import = params[:cdg_import]
  end

  # POST /imports or /imports.json
  def create
    if params.present? && params[:import].present? && params[:import][:data].present?

      @file_total_row, @import = read_file_mont_hash(params[:import][:data], params[:import][:cdg_import])

      mont_files_importa_data(@file_total_row, @import)

      @import.update_column(:termino, true)
    end
  end

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

  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: "Import was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def read_file_mont_hash(files, cdg_import)
      hash_files = []
      import = Import.create(total_files: files.count, cdg_import: cdg_import)

      files.each_with_index do |file, linha|
        hash_files << file
        obj = File.open(file.tempfile.path)

        ImportDatum.create(total: (obj.count-9),
                           sucess: 0,
                           erros: 0,
                           order_file: linha,
                           tb_import_id: import.id)
      end
      return hash_files, import
    end

    def mont_files_importa_data(hash_files, import)
      hash_files.each_with_index do |file, linha|
        import_data = import.import_datas.find_by(order_file: linha)

        regitros, weather_station = mont_obg_dados(file)

        save_weather_datum(regitros, weather_station, import_data)
      end

    end

    def save_weather_datum(registros, weather_station, import_data)
      registros.each_with_index do |registro, index|

        registro.tb_weather_station_id = weather_station.id

        if registro.save
          import_data.update_column(:sucess, import_data.sucess+1)
          puts "------------------------ #{import_data.sucess} - Salvou - #{import_data.erros} ------------------------"
        else
          import_data.update_column(:erros, import_data.erros+1)
          puts "************************ #{index} - ERROR ************************"
        end

      end
    end

    def mont_obg_dados(file)
      data = []
      file_open = File.open(file.tempfile.path)
      weather_station_params = {state: nil, region: nil, station: nil, wmo_code: nil, latitude: nil, altitude: nil, longitude: nil, foundation: nil}


      file_open.each_with_index do |linha_atual, linha|

        row = linha_atual.encode!('UTF-8', 'UTF-8', invalid: :replace).gsub(':','').gsub("\n",'').split("\;")

        case linha
        when 0
          weather_station_params[:region] = row[1]
        when 1
          weather_station_params[:state] = row[1]
        when 2
          weather_station_params[:station] = row[1]
        when 3
          weather_station_params[:wmo_code] = row[1]
        when 4
          weather_station_params[:latitude] = row[1]
        when 5
          weather_station_params[:longitude] = row[1]
        when 6
          weather_station_params[:altitude] = row[1]
        when 7
          weather_station_params[:foundation] = row[1]
        when 8
          # 'Nada'
        else
          data << mont_obj_weather_datum(row)
        end
      end

      weather_station = WeatherStation.find_or_create_by(weather_station_params)

      return data, weather_station

    end

    def mont_obj_weather_datum(row)
      if row.present?
        hora_convert = row[1].gsub(':', '').gsub(' UTC', '')
        hora_convert = hora_convert.chop.chop.insert(2, ':') if hora_convert.size == 6
        hora_convert = hora_convert.insert(2, ':') if hora_convert.size == 4

        obg  =   WeatherDatum.new(  data: row[0],
                                    hora: hora_convert.to_time,
                                    prec_total_horario: row[2],
                                    pres_atmos_nivel_estacao: row[3],
                                    pres_atmos_max: row[4],
                                    pres_atmos_min: row[5],
                                    radiacao_global: row[6],
                                    temp_ar_bulso_seco: row[7],
                                    temp_ponto_orvalho: row[8],
                                    temp_min_hora_ant: row[9],
                                    temp_monima_hora_ant: row[10],
                                    temp_orvalho_max_hora_ant: row[11],
                                    temp_orvalho_min_hora_ant: row[12],
                                    umid_rel_max_hora_ant: row[13],
                                    umid_rel_min_hora_ant: row[14],
                                    umid_relativa_ar: row[15],
                                    vento_direcao_horario: row[16],
                                    vento_rajada_maxima: row[17],
                                    vento_velocidade_horario: row[18])
        return obg
      end
    end



    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_params
      params.fetch(:import, {})
    end
end
