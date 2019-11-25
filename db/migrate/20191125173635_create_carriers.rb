class CreateCarriers < ActiveRecord::Migration[5.2]
  def change
    create_table :carriers do |t|
      t.references :user, foreign_key: true
      t.string :carrier_type

      t.timestamps
    end
  end
end
