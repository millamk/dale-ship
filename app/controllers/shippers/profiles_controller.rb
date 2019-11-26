class Shippers::ProfilesController < ApplicationController
  def edit
    redirect_to root_path, alert: 'Invalid page' if current_user.shipper.nil?
  end
end
