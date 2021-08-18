class CreateWeatherStations < ActiveRecord::Migration[6.1]
  def change
    unless table_exists? WeatherStation.table_name
      create_table WeatherStation.table_name do |t|
        t.string :region
        t.string :state
        t.string :station
        t.string :wmo_code
        t.string :latitude
        t.string :longitude
        t.string :altitude
        t.date :foundation

        t.timestamps
      end
    end
  end
end
