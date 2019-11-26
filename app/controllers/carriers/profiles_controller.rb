class Carriers::ProfilesController < ApplicationController
  def edit
    redirect_to root_path, alert: 'Invalid page' if current_user.carrier.nil?
  end
end
