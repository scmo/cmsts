json.array!(@measurements) do |measurement|
  json.array! [(measurement[0].to_f * 1000).to_i, measurement[1]]
end
