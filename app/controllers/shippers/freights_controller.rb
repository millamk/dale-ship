class Shippers::FreightsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @freights = Freight.all
  end

  def show
    @freight = Freight.find(params[:id])
  end
end
