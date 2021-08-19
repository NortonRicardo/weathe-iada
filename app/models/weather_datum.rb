class WeatherDatum < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_weather_data"
  self.sequence_name = "tb_weather_data_seq"
  # relationships .............................................................
  belongs_to :weather_station, class_name: 'WeatherStation', foreign_key: :tb_weather_station_id
  # validations ...............................................................
  validates_presence_of :tb_weather_station_id
  # callbacks .................................................................
  before_create :set_ano_mes

  def hora_time
    self.hora.to_formatted_s(:time)
  end

  private
    def set_ano_mes
      self.ano = self.data.strftime("%Y")
      self.mes = self.data.strftime("%m")
      self.dia = self.data.strftime("%d")
    end

end
