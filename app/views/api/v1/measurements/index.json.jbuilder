json.array!(@measurements) do |measurement|
  # measurement.measured_at
  json.array! [(measurement.measured_at.to_f * 1000).to_i, measurement.measured_value]
  # , :measured_value
  # json.url measurement_url(measurement, format: :json)
end
