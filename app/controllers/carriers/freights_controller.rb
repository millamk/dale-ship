class Carriers::FreightsController < ApplicationController
  before_action :freight_params, only: :create

  def index
    @freights = current_user.carrier.freights.all
  end

  def new
    @freight = Freight.new
  end

  def create
    @freight = Freight.new(freight_params)
    @freight.carrier_id = current_user.carrier.id
    if @freight.save
      redirect_to carriers_freight_path(@freight)
    else
      render :new
    end
  end

  def edit
    @freight = Freight.find(params[:id])
  end

  def update
    @freight = Freight.find(params[:id])
    if @freight.update(freight_params)
      redirect_to carriers_freight_path(@freight)
    else
      render :edit
    end
  end

  def show
    @freight = Freight.find(params[:id])
  end

  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy
    redirect_to root_path
  end

  private

  def freight_params
    params.require(:freight).permit(:origin, :destination, :ready_to_load,
                                    :type_of_shipment, :container_pack,
                                    :expire_date, :price)
  end
end
