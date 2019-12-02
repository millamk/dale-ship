class AddCoordinatesToPorts < ActiveRecord::Migration[5.2]
  def change
    add_column :ports, :latitude, :float
    add_column :ports, :longitude, :float
  end
end
