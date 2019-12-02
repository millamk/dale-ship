class BookingsController < ApplicationController
  def create
    # unless Freight.find(params[:freight_id]).shippers.count > 0
    @booking = Booking.new
    @booking.shipper = current_user.shipper
    @booking.freight = Freight.find(params[:freight_id])
    @booking.status = 'Pending'
    @booking.save
    redirect_to shippers_booking_path(@booking)
    # else
    #   flash[:alert] = "We're sorry to inform that this freight is no longer available"
    #   redirect_to root_path
    # end
  end
end
