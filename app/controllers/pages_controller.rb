class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def search
    if params[:origin].present? && params[:destination].present? && params[:ready_to_load].present? && params[:type_of_shipment].present?
      sql_query = "origin ILIKE :origin AND destination ILIKE :destination AND ready_to_load :ready_to_load"
      @freights = Freight.where(sql_query, origin: "%#{params[:origin]}%",
        destination: "%#{params[:destination]}%",
        ready_to_load: "%#{params[:ready_to_load]}",
        type_of_shipment: "%#{params[:type_of_shipment]}")
    else
      @freights = Freight.all
    end
  end

  def home
  end
end

# type_of_shipment
