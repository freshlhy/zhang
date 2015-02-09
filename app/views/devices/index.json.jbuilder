json.array!(@devices) do |device|
  json.extract! device, :id, :dept1st, :dept2nd, :dept3rd, :type_id, :brand_id, :model, :commissioning, :asset_number, :value, :fund_source, :factory_number, :production_date, :department_id, :user, :user_phone, :location, :ip, :mac, :os, :note
  json.url device_url(device, format: :json)
end
