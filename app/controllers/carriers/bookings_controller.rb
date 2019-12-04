class Carriers::BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update]

  def index
    @bookings = Booking.joins(:freight).where(freights: {carrier_id: current_user.carrier})
    @bookings = @bookings.where(status: params[:status]) if params[:status].present?
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to carriers_bookings_path
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
