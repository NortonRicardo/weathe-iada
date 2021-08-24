class ImportFilesWeatherJob < ApplicationJob
  queue_as :importFile

  # redis-server
  # bundle exec sidekiq -q importFile -c 8

  def perform(*args)
    @import = Import.find(args.first)

    mont_files_importa_data(@import)

    @import.update_column(:termino, true)
  end

  private
  def mont_files_importa_data(import)
    import.import_datas.order('id').each do |file|
      regitros = mont_obg_dados(file)
      save_weather_datum(regitros, file)
    end
  end

  def mont_obg_dados(file)
    data = []
    @weather_station = nil

    weather_station_params = {
      state: nil,
      region: nil,
      station: nil,
      wmo_code: nil,
      latitude: nil,
      altitude: nil,
      longitude: nil,
      foundation: nil
    }

    # Cria Rota Segundo id do arquivo
    file_path_to_save_to = "public/import/file_import_#{file.id}"
    # Salva o arquivo localmente
    File.write(file_path_to_save_to, file.file_dowlod.force_encoding("UTF-8"))
    # Faz leitura do arquivo salvo
    files_row = File.read(file_path_to_save_to)
    # contador de linha
    linha = 0

    files_row.each_line do |linha_atual|
      row = linha_atual.gsub(':','').gsub("\n",'').split("\;")

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
        @weather_station = WeatherStation.find_or_create_by(weather_station_params)
      else
        data << mont_obj_weather_datum(row, @weather_station)
      end
      linha += 1
    end

    FileUtils.rm_rf(Dir.glob(file_path_to_save_to))

    return data
  end

  def mont_obj_weather_datum(row, weather_station)
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
                                  vento_velocidade_horario: row[18],
                                  tb_weather_station_id: weather_station.id)
      return obg
    end
  end

  def save_weather_datum(registros, import_data)
    registros.each_with_index do |registro, index|

      if registro.save
        import_data.update_column(:sucess, import_data.sucess+1)
        puts "------------------------ #{import_data.sucess} - Salvou - #{import_data.erros} ------------------------"
      else
        import_data.update_column(:erros, import_data.erros+1)
        puts "************************ #{index} - ERROR ************************"
      end

    end
  end
end
