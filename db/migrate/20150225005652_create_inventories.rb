class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :type_id
      t.integer :brand_id
      t.string :model
      t.string :asset_number
      t.integer :value
      t.string :fund_source
      t.string :factory_number
      t.date :production_date
      t.string :note
      t.timestamps null: false
    end
  end
end
