class CreateMaintenancers < ActiveRecord::Migration
  def change
    create_table :maintenancers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
