class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def search
    @booking = Booking.new
    @freights = Freight.start(params[:origin]).finish(params[:destino]).ready(Date.parse(params[:ready_to_load])).type(params[:type_of_shipment])
  end

  def home
  end
end
