class RemoveOtherFieldsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :shipper, :boolean, default: false
    remove_column :users, :carrier, :boolean, default: false
  end
end
