class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def search
    @booking = Booking.new
    @results = []
    @freights = Freight.start(params[:origin]).finish(params[:destino]).ready(Date.parse(params[:ready_to_load])).type(params[:type_of_shipment])
    @freights.each do |freight|
      freight.bookings.each do |booking|
        if booking.status == 'approved'
          @results << freight
        end
      end
    end
    @search = @freights - @results

    @ports = [Port.find_by(name: params[:origin]), Port.find_by(name: params[:destino])]

    @markers = @ports.map do |port|
      {
        lat: port.latitude,
        lng: port.longitude
      }
    end
  end

  def home
  end
end
