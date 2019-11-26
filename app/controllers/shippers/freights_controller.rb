class Shippers::FreightsController < ApplicationController
  def index
    @freights = Freight.all
  end
end
