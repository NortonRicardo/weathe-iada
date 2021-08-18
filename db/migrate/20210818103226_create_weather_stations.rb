class CreateWeatherStations < ActiveRecord::Migration[6.1]
  def change
    unless table_exists? WeatherStation.table_name
      create_table WeatherStation.table_name do |t|
        t.string :region    , comment: 'REGIAO'
        t.string :state     , comment: 'UF'
        t.string :station   , comment: 'ESTADO'
        t.string :wmo_code  , comment: 'CODIGO (WMO)'
        t.string :latitude  , comment: 'LATITUDE'
        t.string :longitude , comment: 'LONGITUDE'
        t.string :altitude  , comment: 'ALTITUDE'
        t.date :foundation  , comment: 'DATA DE FUNDACAO'

        t.timestamps
      end
    end
  end
end
