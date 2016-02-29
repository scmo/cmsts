json.array!(@stations) do |station|
  json.extract! station, :id, :name, :details, :location
  json.url station_url(station, format: :json)
end
