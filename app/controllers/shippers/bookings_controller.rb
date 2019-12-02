class Shippers::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @shipper = current_user.shipper
  end
end
