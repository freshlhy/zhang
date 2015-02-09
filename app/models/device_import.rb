class DeviceImport
  # switch to ActiveModel::Model in Rails 4
  extend ActiveModel::Model
  include ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :file

  def initialize(attributes = {})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def save
    if imported_devices.map(&:valid?).all?
      imported_devices.each(&:save!)
      true
    else
      imported_devices.each_with_index do |device, index|
        device.errors.full_messages.each do |message|
          errors.add :base, "表格第#{index+2}行: #{message}"
        end
      end
      false
    end
  end

  def imported_devices
    @imported_devices ||= load_imported_devices
  end

  def load_imported_devices
    spreadsheet = open_spreadsheet
    header = ['id', 'dept1st', 'dept2nd', 'dept3rd', 'type_id', 'brand_id', 'model', 'commissioning', 'asset_number', 'value', 'fund_source', 'factory_number', 'production_date', 'department_id', 'user', 'user_phone', 'location', 'ip', 'mac', 'os', 'note']
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      
      type_name_raw = row["type_id"]
      if type_name_raw
        type_name = "#{type_name_raw}"
        type_name.strip!
        if type_name.size > 0
          type = Type.find_or_create_by!(name: type_name)
          row["type_id"] = type.id
        end
      end

      brand_name_raw = row["brand_id"]
      if brand_name_raw
        brand_name = "#{brand_name_raw}"
        brand_name.strip!
        if brand_name.size > 0
          brand = Brand.find_or_create_by!(name: brand_name)
          row["brand_id"] = brand.id
        end
      end

      department_name_raw = row["department_id"]
      if department_name_raw
        department_name = "#{department_name_raw}"
        department_name.strip!
        if department_name.size > 0
          department = Department.find_or_create_by!(name: department_name)
          row["department_id"] = department.id
        end
      end

      device = Device.find_by_id(row["id"]) || Device.new
      device.attributes = row.to_hash.slice(*row.to_hash.keys)
      device
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


  def parents
    []
  end

  def name
    "DeviceImport"
  end

end
