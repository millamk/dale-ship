class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def search
    if params[:origin].present? && params[:destination].present?
      sql_query = "origin ILIKE :origin AND destination ILIKE :destination"
      @freights = Freight.where(sql_query, origin: "%#{params[:origin]}%", destination: "%#{params[:destination]}%")
    else
      @freights = Freight.all
    end
  end

  def home
  end
end
