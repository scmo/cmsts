json.array!(@value_types) do |value_type|
  json.extract! value_type, :id, :name, :details, :unit
  json.url value_type_url(value_type, format: :json)
end
