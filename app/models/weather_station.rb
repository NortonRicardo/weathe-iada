class WeatherStation < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_weather_station"
  self.sequence_name = "tb_weather_station_seq"
  # relationships .............................................................
  has_many :wether_data, class_name: 'WeatherDatum', foreign_key: :tb_weather_station_id
  # validations ...............................................................
  validates_uniqueness_of :wmo_code
  validates_presence_of :region,
                        :state,
                        :station,
                        :wmo_code
  # callbacks .................................................................
  def region_to_s
    case self.region.upcase
    when 'S'
      'Sul'
    when 'N'
      'Norte'
    when 'SE'
      'Sudeste'
    when 'NE'
      'Nordeste'
    when 'CO'
      'Centro Oeste'
    else
      self.region
    end
  end
end