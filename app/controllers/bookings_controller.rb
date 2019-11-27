class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.shipper = current_user.shipper
    @booking.freight = Freight.find(:freight_id)
    if @booking.save
      redirect_to
  end
end
