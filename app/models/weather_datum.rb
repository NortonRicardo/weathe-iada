class WeatherDatum < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_weather_data"
  self.sequence_name = "tb_weather_data_seq"
  # relationships .............................................................
  belongs_to :weather_station,
             class_name: 'WeatherStation',
             foreign_key: :tb_weather_station_id
  # validations ...............................................................
  validates_presence_of :data,
                        :hora,
                        :tb_weather_station_id
  # callbacks .................................................................
  before_create :set_ano_mes
  before_validation :validates_presence_data_hora_wather_station

  HUMANIZED_ATTRIBUTES = {
     data:                      'Data da Leitura',
     ano:                       'Ano',
     mes:                       'Mes',
     dia:                       'Dia',
     hora:                      'Hora da Leitura',
     prec_total_horario:        'PRECIPITA«√O TOTAL, HOR¡RIO (mm)',
     pres_atmos_nivel_estacao:  'PRESSAO ATMOSFERICA AO NIVEL DA ESTACAO, HORARIA (mB)',
     pres_atmos_max:            'PRESS√O ATMOSFERICA MAX.NA HORA ANT. (AUT) (mB)',
     pres_atmos_min:            'PRESS√O ATMOSFERICA MIN. NA HORA ANT. (AUT) (mB)',
     radiacao_global:           'RADIACAO GLOBAL (KJ/m≤)',
     temp_ar_bulso_seco:        'TEMPERATURA DO AR - BULBO SECO, HORARIA (∞C)',
     temp_ponto_orvalho:        'TEMPERATURA DO PONTO DE ORVALHO (∞C)',
     temp_min_hora_ant:         'TEMPERATURA M¡XIMA NA HORA ANT. (AUT) (∞C)',
     temp_monima_hora_ant:      'TEMPERATURA MÕNIMA NA HORA ANT. (AUT) (∞C)',
     temp_orvalho_max_hora_ant: 'TEMPERATURA ORVALHO MAX. NA HORA ANT. (AUT) (∞C)',
     temp_orvalho_min_hora_ant: 'TEMPERATURA ORVALHO MIN. NA HORA ANT. (AUT) (∞C)',
     umid_rel_max_hora_ant:     'UMIDADE REL. MAX. NA HORA ANT. (AUT) (%)',
     umid_rel_min_hora_ant:     'UMIDADE REL. MIN. NA HORA ANT. (AUT) (%)',
     umid_relativa_ar:          'UMIDADE RELATIVA DO AR, HORARIA (%)',
     vento_direcao_horario:     'VENTO, DIRE«√O HORARIA (gr) (∞ (gr))',
     vento_rajada_maxima:       'VENTO, RAJADA MAXIMA (m/s)',
     vento_velocidade_horario:  'VENTO, VELOCIDADE HORARIA (m/s)',
     tb_weather_station_id:     'Estação Meteriologica'
  }

  def self.human_attribute_name(attr, vazio = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def hora_time
    self.hora.to_formatted_s(:time)
  end

  private
    def set_ano_mes
      self.ano = self.data.strftime("%Y")
      self.mes = self.data.strftime("%m")
      self.dia = self.data.strftime("%d")
    end

  def validates_presence_data_hora_wather_station
    obj = WeatherDatum.find_by(data: self.data,
                               hora: self.hora,
                               tb_weather_station_id: self.tb_weather_station_id)
    if obj.present?
      self.errors.add(:base, 'Registro já consta no sistema!!!!!!')
    end
  end
end