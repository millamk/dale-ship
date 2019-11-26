class Carriers::FreightsController < ApplicationController
  def index
    @freights = Freight.all
  end

  def new
    @freight = Freight.new
  end
end
