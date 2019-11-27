class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # if params[:query].present?
    #   sql_query = "title ILIKE :query OR address ILIKE :query OR type_of_meal ILIKE :query OR type_of_event ILIKE :query"
    #   @freights = Freight.where(sql_query, query: "%#{params[:query]}%").page(params[:page]).per(3)
    #    sql_query = "title ILIKE :query OR address ILIKE :query OR type_of_meal ILIKE :query OR type_of_event ILIKE :query"
    #    @freights = Freight.where(sql_query, query: "%#{params[:query]}%").page(params[:page]).per(10)
    # # else
    #   # @freights = Freight.all.page(params[:page])
    # end
  end
end
