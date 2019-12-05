class Shippers::BookingsController < ApplicationController
  before_action :set_user

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @shipper = current_user.shipper
  end

  private

  def set_user
    @shipper = current_user
  end
end
