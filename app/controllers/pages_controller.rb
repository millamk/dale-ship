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
  end

  def home
  end
end
