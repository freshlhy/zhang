class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :dept1st
      t.string :dept2nd
      t.string :dept3rd
      t.integer :type_id
      t.integer :brand_id
      t.string :model
      t.date :commissioning
      t.string :asset_number
      t.integer :value
      t.string :fund_source
      t.string :factory_number
      t.date :production_date
      t.integer :department_id
      t.string :user
      t.string :user_phone
      t.string :location
      t.string :ip
      t.string :mac
      t.string :os
      t.string :note

      t.timestamps null: false
    end
  end
end
