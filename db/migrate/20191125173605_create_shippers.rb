class CreateShippers < ActiveRecord::Migration[5.2]
  def change
    create_table :shippers do |t|
      t.references :user, foreign_key: true
      t.string :vol_freq

      t.timestamps
    end
  end
end
