class AddCarrierToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :carrier, :boolean, default: :false
  end
end
