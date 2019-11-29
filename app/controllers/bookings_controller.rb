class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.shipper = current_user.shipper
    @booking.freight = Freight.find(params[:freight_id])
    @booking.status = 'Pending'
    @booking.save
    redirect_to shippers_booking_path(@booking)
  end
end
