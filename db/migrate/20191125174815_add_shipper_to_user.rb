class AddShipperToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shipper, :boolean, default: false
  end
end
