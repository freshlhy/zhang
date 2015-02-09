json.array!(@maintenancers) do |maintenancer|
  json.extract! maintenancer, :id, :name
  json.url maintenancer_url(maintenancer, format: :json)
end
