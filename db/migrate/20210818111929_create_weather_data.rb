class CreateWeatherData < ActiveRecord::Migration[6.1]
  def change
    unless table_exists? WeatherDatum.table_name
      create_table WeatherDatum.table_name do |t|
        t.date :data                           , comment: 'Data da Leitura'
        t.string :ano                          , comment: 'Ano'
        t.string :mes                          , comment: 'Mes'
        t.string :dia                          , comment: 'Dia'
        t.time :hora                           , comment: 'Hora da Leitura'
        t.float :prec_total_horario            , comment: 'PRECIPITA«√O TOTAL, HOR¡RIO (mm)'
        t.float :pres_atmos_nivel_estacao      , comment: 'PRESSAO ATMOSFERICA AO NIVEL DA ESTACAO, HORARIA (mB)'
        t.float :pres_atmos_max                , comment: 'PRESS√O ATMOSFERICA MAX.NA HORA ANT. (AUT) (mB)'
        t.float :pres_atmos_min                , comment: 'PRESS√O ATMOSFERICA MIN. NA HORA ANT. (AUT) (mB)'
        t.float :radiacao_global               , comment: 'RADIACAO GLOBAL (KJ/m≤)'
        t.float :temp_ar_bulso_seco            , comment: 'TEMPERATURA DO AR - BULBO SECO, HORARIA (∞C)'
        t.float :temp_ponto_orvalho            , comment: 'TEMPERATURA DO PONTO DE ORVALHO (∞C)'
        t.float :temp_min_hora_ant             , comment: 'TEMPERATURA M¡XIMA NA HORA ANT. (AUT) (∞C)'
        t.float :temp_monima_hora_ant          , comment: 'TEMPERATURA MÕNIMA NA HORA ANT. (AUT) (∞C)'
        t.float :temp_orvalho_max_hora_ant     , comment: 'TEMPERATURA ORVALHO MAX. NA HORA ANT. (AUT) (∞C)'
        t.float :temp_orvalho_min_hora_ant     , comment: 'TEMPERATURA ORVALHO MIN. NA HORA ANT. (AUT) (∞C)'
        t.float :umid_rel_max_hora_ant         , comment: 'UMIDADE REL. MAX. NA HORA ANT. (AUT) (%)'
        t.float :umid_rel_min_hora_ant         , comment: 'UMIDADE REL. MIN. NA HORA ANT. (AUT) (%)'
        t.float :umid_relativa_ar              , comment: 'UMIDADE RELATIVA DO AR, HORARIA (%)'
        t.float :vento_direcao_horario         , comment: 'VENTO, DIRE«√O HORARIA (gr) (∞ (gr))'
        t.float :vento_rajada_maxima           , comment: 'VENTO, RAJADA MAXIMA (m/s)'
        t.float :vento_velocidade_horario      , comment: 'VENTO, VELOCIDADE HORARIA (m/s)'
        t.belongs_to WeatherStation.table_name , comment: 'Relacionamento com estacao climativa'
        t.timestamps
      end
    end
  end
end
