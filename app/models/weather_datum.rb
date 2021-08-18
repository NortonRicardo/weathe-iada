class WeatherDatum < ApplicationRecord
  # main config ...............................................................
  self.table_name = "tb_weather_data"
  self.sequence_name = "tb_weather_data_seq"
  # relationships .............................................................
  belongs_to :weather_station, class_name: 'WeatherStation', foreign_key: :tb_weather_station_id
  # validations ...............................................................
  # validates_uniqueness_of :wmo_code
  # validates_presence_of :region,
  #                       :state,
  #                       :station,
  #                       :wmo_code,
  #                       :latitude,
  #                       :longitude,
  #                       :altitude
  # callbacks .................................................................
end
