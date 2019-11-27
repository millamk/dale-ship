class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.shipper = current_user.shipper
    @booking.freight = Freight.find(params[:freight_id])
    @booking.save
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
