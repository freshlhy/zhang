class InventoryImport
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
    if imported_inventories.map(&:valid?).all?
      imported_inventories.each(&:save!)

      connection = ActiveRecord::Base.connection
      connection.execute("SELECT setval('inventories_id_seq', (SELECT MAX(id) FROM inventories))") 
      
      true
    else
      imported_inventories.each_with_index do |inventory, index|
        inventory.errors.full_messages.each do |message|
          errors.add :base, "表格第#{index+2}行: #{message}"
        end
      end
      false
    end
  end

  def imported_inventories
    @imported_inventories ||= load_imported_inventories
  end

  def load_imported_inventories
    spreadsheet = open_spreadsheet
    header = ['id', 'type_id', 'brand_id', 'model', 'asset_number', 'value', 'fund_source', 'factory_number', 'production_date', 'note']
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

      inventory = Inventory.find_by_id(row["id"]) || Inventory.new
      inventory.attributes = row.to_hash.slice(*row.to_hash.keys)
      inventory
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
    "InventoryImport"
  end

end
