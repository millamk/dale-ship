class Shippers::FreightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR address ILIKE :query OR type_of_meal ILIKE :query OR type_of_event ILIKE :query"
      @events = Event.where(sql_query, query: "%#{params[:query]}%").page(params[:page]).per(3)
       sql_query = "title ILIKE :query OR address ILIKE :query OR type_of_meal ILIKE :query OR type_of_event ILIKE :query"
       @events = Event.where(sql_query, query: "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @events = Event.all.page(params[:page]).per(3)
    end
  end

  def edit
    @freight = Freight.find(params[:id])
  end

  def update
    @freight = Freight.find(params[:id])
    if @freight.update(freight_params)
      redirect_to freight_path(@freight)
    else
      render :edit
    end
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

  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy
    redirect_to root_path
  end

  def show
    @freight = Freight.find(params[:id])
    @booking = Booking.new
  end

  private

  def freight_params
    params.require(:freight).permit(:modal, :origin_port, :destination_port, :type_of_shipment,
                                  :container_pack, :carrier_id, :expire_date, :price, :transit_time)
  end
end
