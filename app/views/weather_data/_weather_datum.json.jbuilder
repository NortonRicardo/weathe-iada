json.extract! weather_datum, :id, :data, :hora, :prec_total_horario, :pres_atmos_nivel_estacao, :pres_atmos_max, :pres_atmos_min, :radiacao_global, :temp_ar_bulso_seco, :temp_ponto_orvalho, :temp_min_hora_ant, :temp_monima_hora_ant, :temp_orvalho_max_hora_ant, :temp_orvalho_min_hora_ant, :umid_rel_max_hora_ant, :umid_rel_min_hora_ant, :umid_relativa_ar, :vento_direcao_horario, :vento_rajada_maxima, :vento_velocidade_horario, :created_at, :updated_at
json.url weather_datum_url(weather_datum, format: :json)
