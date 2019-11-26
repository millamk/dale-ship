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

end
