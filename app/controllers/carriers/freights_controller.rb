class Carriers::FreightsController < ApplicationController
  before_action
  def index
    @freights = current_user.carrier.freights.all
  end

  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.user = current_user
    if @freight.save
      redirect_to freight_path(@freight)
    else
      render :new
    end
  end

  private

  def freight_params
    params.require(:freight).permit(:origin, :destination, :ready_to_load,
                                    :type_of_shipment, :container_pack,
                                    :expire_date, :price)
  end
end
