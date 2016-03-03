json.array!(@measurements) do |measurement|
  json.array! [(measurement.measured_at.to_f * 1000).to_i, measurement.measured_value]
end
