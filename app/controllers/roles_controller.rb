class RolesController < ApplicationController
  def new
  end

  def create
    if params[:role] == 'carrier'
      c = Carrier.new
      c.user = current_user
      c.carrier_type = 'SMB Forwarder'
      c.save
    else
      s = Shipper.new
      s.user = current_user
      s.save
    end
    redirect_to root_path
  end
end
