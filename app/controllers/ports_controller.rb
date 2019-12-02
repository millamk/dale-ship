class PortsController < ApplicationController
  def index
    @ports = Port.all #returns ports with coordinates

    @markers = @ports.map do |port|
      {
        lat: port.latitude,
        lng: port.longitude
      }
    end
    raise
  end
end
