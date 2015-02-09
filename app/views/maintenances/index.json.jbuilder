json.array!(@maintenances) do |maintenance|
  json.extract! maintenance, :id, :mdate, :location
  json.url maintenance_url(maintenance, format: :json)
end
