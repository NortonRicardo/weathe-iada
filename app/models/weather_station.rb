class WeatherStation < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_weather_station"
  self.sequence_name = "tb_weather_station_seq"
  # relationships .............................................................
  has_many :wether_data, class_name: 'WeatherDatum', foreign_key: :id
  # validations ...............................................................
  validates_uniqueness_of :wmo_code
  validates_presence_of :region,
                        :state,
                        :station,
                        :wmo_code,
                        :latitude,
                        :longitude,
                        :altitude
  # callbacks .................................................................

end