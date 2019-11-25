class CreateFreights < ActiveRecord::Migration[5.2]
  def change
    create_table :freights do |t|
      t.string :modal
      t.string :origin
      t.string :destination
      t.date :ready_to_load
      t.string :type_of_shipment
      t.string :container_pack
      t.references :carrier, foreign_key: true
      t.date :expire_date
      t.integer :price

      t.timestamps
    end
  end
end
