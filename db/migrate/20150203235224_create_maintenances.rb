class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
    	t.integer :device_id
      t.date :mdate
      t.string :location

      t.integer :maintenancer_ids, array: true, default: []

      t.timestamps null: false
    end
  end
end
