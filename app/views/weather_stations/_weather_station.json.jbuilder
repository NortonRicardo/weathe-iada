json.extract! weather_station, :id, :region, :state, :station, :wmo_code, :latitude, :longitude, :altitude, :foundation, :created_at, :updated_at
json.url weather_station_url(weather_station, format: :json)
