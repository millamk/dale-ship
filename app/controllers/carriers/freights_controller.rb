class Carriers::FreightsController < ApplicationController
  before_action :freight_params, only: :create

  def index
    @freights_valid = current_user.carrier.freights.not_expired
    @freights_expired = current_user.carrier.freights - @freights_valid
    @bookings = Booking.joins(:freight).where(freights: { carrier_id: current_user.carrier }, status: 'available')
  end

  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.origin = Port.find(params[:freight][:origin]).name
    @freight.destination = Port.find(params[:freight][:destination]).name
    @freight.carrier_id = current_user.carrier.id
    if @freight.save
      redirect_to carriers_freights_path
    else
      render :new
    end
  end

  def edit
    @freight = Freight.find(params[:id])
  end

  def update
    @freight = Freight.find(params[:id])
    @freight.origin = Port.find(params[:freight][:origin]).name
    @freight.destination = Port.find(params[:freight][:destination]).name
    @freight.update(freight_params)
    redirect_to carriers_freights_path
  end

  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy
    redirect_to root_path
  end

  private

  def freight_params
    params.require(:freight).permit(:ready_to_load, :type_of_shipment,
                                    :container_pack, :expire_date, :price)
  end
end
